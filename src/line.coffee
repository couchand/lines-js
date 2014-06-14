# line

class Line
  constructor: ({@from, @to, @style}) ->
    unless @from?.length is 2
      throw new Error "from coordinates required"
    unless @to?.length is 2
      throw new Error "to coordinates required"
    unless @vertical() or @horizontal()
      throw new Error "coordinates must be collinear"

  horizontal: ->
    @from[1] is @to[1]

  vertical: ->
    @from[0] is @to[0]

module.exports = (opts) -> new Line opts or {}
