# lines

cell = require './cell'
line = require './line'

class Lines
  constructor: ->
    @_lines = []

  line: ->
    @_lines = @_lines.concat [line.apply null, arguments]
    this

  box: ->
    if arguments.length is 1
      {from, to, style} = arguments[0]
    else
      from = arguments[0]
      to = arguments[1]
      style = arguments[2]

    @line
      from: from
      to: [from[0], to[1]]
      style: style
    @line
      from: [from[0], to[1]]
      to: to
      style: style
    @line
      from: to
      to: [to[0], from[1]]
      style: style
    @line
      from: [to[0], from[1]]
      to: from
      style: style
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
          row[left].right l.style
          row[right].left l.style

          for col in [left+1...right]
            row[col].left l.style
            row[col].right l.style

        when l.vertical()
          up = Math.min l.from[1], l.to[1]
          down = Math.max l.from[1], l.to[1]

          col = l.from[0]
          buffers[up][col].down l.style
          buffers[down][col].up l.style

          for row in [up+1...down]
            buffers[row][col].up l.style
            buffers[row][col].down l.style

    buffers
      .map (buffer) ->
        buffer
          .map (cell) ->
            cell.toString()
          .join ''
      .join '\n'

module.exports = -> new Lines()
