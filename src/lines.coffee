# lines

line = require './line'

class Lines
  constructor: ->
    @_lines = []

  line: (opts) ->
    @_lines = @_lines.concat [line opts]
    this

  box: ({from, to, style}) ->
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
      (' ' for col in [0..cols])
    for l in lines
      for col in [l.from[0]..l.to[0]]
        for row in [l.from[1]..l.to[1]]
          buffers[row][col] = switch on
            when l.horizontal() then "─"
            when l.vertical() then "│"
    buffers
      .map (buffer) -> buffer.join ''
      .join '\n'

module.exports = -> new Lines()
