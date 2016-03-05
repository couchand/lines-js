# lines

Stream = require 'stream'

cell = require './cell'
line = require './line'
terminalColor = require './color'

class Lines extends Stream.Readable
  constructor: ->
    super()
    @_lines = []

  _read: ->
  flush: ->
    @push @toString()

  line: ->
    @_lines = @_lines.concat [line.apply null, arguments]
    this

  box: ->
    if arguments.length is 1
      {from, to, style, color} = arguments[0]
    else
      from = arguments[0]
      to = arguments[1]
      style = arguments[2]
      color = arguments[3]

    @line
      from: from
      to: [from[0], to[1]]
      style: style
      color: color
    @line
      from: [from[0], to[1]]
      to: to
      style: style
      color: color
    @line
      from: to
      to: [to[0], from[1]]
      style: style
      color: color
    @line
      from: [to[0], from[1]]
      to: from
      style: style
      color: color
    this

  lines: ->
    @_lines

  toString: ->
    lines = @lines()
    cols = Math.max(
      Math.max.apply null, lines.map (l) -> l.from[0]
      Math.max.apply null, lines.map (l) -> l.to[0]
    )
    rows = Math.max(
      Math.max.apply null, lines.map (l) -> l.from[1]
      Math.max.apply null, lines.map (l) -> l.to[1]
    )
    buffers = for row in [0..rows]
      for col in [0..cols]
        cell()

    for l in lines
      switch on
        when l.horizontal()
          left = Math.min l.from[0], l.to[0]
          right = Math.max l.from[0], l.to[0]

          row = buffers[l.from[1]]
          row[left].right l.style, l.color
          row[right].left l.style, l.color

          for col in [left+1...right]
            row[col].left l.style, l.color
            row[col].right l.style, l.color

        when l.vertical()
          up = Math.min l.from[1], l.to[1]
          down = Math.max l.from[1], l.to[1]

          col = l.from[0]
          buffers[up][col].down l.style, l.color
          buffers[down][col].up l.style, l.color

          for row in [up+1...down]
            buffers[row][col].up l.style, l.color
            buffers[row][col].down l.style, l.color

    currentColor =
      foreground: 'none'
      background: 'none'

    stringVal = buffers
      .map (buffer) ->
        buffer
          .map (cell) ->
            { char, color } = cell.toString()

            output = char

            if char isnt ' '
              { foreground: fore, background: back } = color

              if fore and fore isnt currentColor.foreground
                currentColor.foreground = fore
                output = terminalColor.foreground(fore) + output

              if back and back isnt currentColor.background
                currentColor.background = back
                output = terminalColor.background(back) + output

            output
          .join ''
      .join '\n'

    if currentColor.foreground isnt 'none'
      stringVal += terminalColor.foreground 'none'
    if currentColor.background isnt 'none'
      stringVal += terminalColor.background 'none'

    stringVal

module.exports = -> new Lines()
