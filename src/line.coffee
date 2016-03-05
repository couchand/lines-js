# line

class Line
  constructor: ->
    if arguments.length is 1
      {@from, @to, @style, @color} = arguments[0]
    else
      @from = arguments[0]
      @to = arguments[1]
      @style = arguments[2]
      @color = {}
      @color.foreground = arguments[3]
      @color.background = arguments[4]

    unless this instanceof Line
      return new Line {@from, @to, @style, @color}

    unless @from?.length is 2
      throw new Error "from coordinates required"
    unless @to?.length is 2
      throw new Error "to coordinates required"
    unless @vertical() or @horizontal()
      throw new Error "coordinates must be collinear"
    if @vertical() and @horizontal()
      throw new Error "coordinates must not be coincident"

    @style ?= "normal"
    @color ?= {}
    @color.foreground ?= "none"
    @color.background ?= "none"

  horizontal: ->
    @from[1] is @to[1]

  vertical: ->
    @from[0] is @to[0]

module.exports = Line
