# cell

chars = require './char-map'

class Cell
  constructor: ->
    @_dirs =
      left: 'none'
      up: 'none'
      right: 'none'
      down: 'none'

  left: ->
    if arguments.length
      @_dirs.left = arguments[0]
      this
    else
      @_dirs.left

  up: ->
    if arguments.length
      @_dirs.up = arguments[0]
      this
    else
      @_dirs.up

  right: ->
    if arguments.length
      @_dirs.right = arguments[0]
      this
    else
      @_dirs.right

  down: ->
    if arguments.length
      @_dirs.down = arguments[0]
      this
    else
      @_dirs.down

  toString: ->
    left = chars[@left()] or chars.normal
    up = left[@up()] or left.normal
    right = up[@right()] or up.normal
    down = right[@down()] or right.normal

module.exports = -> new Cell()
