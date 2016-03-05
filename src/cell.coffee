# cell

chooseCharacter = require './char-query'
chooseColor = require './color-query'

blankStyle = ->
  style: 'none'
  color:
    foreground: 'none'
    background: 'none'

class Cell
  constructor: ->
    @_dirs =
      left: blankStyle()
      up: blankStyle()
      right: blankStyle()
      down: blankStyle()

  left: ->
    if arguments.length
      @_dirs.left.style = arguments[0]
      if arguments.length > 1
        color = arguments[1]
        @_dirs.left.color.foreground = color.foreground if color.foreground
        @_dirs.left.color.background = color.background if color.background
      this
    else
      @_dirs.left

  up: ->
    if arguments.length
      @_dirs.up.style = arguments[0]
      if arguments.length > 1
        color = arguments[1]
        @_dirs.up.color.foreground = color.foreground if color.foreground
        @_dirs.up.color.background = color.background if color.background
      this
    else
      @_dirs.up

  right: ->
    if arguments.length
      @_dirs.right.style = arguments[0]
      if arguments.length > 1
        color = arguments[1]
        @_dirs.right.color.foreground = color.foreground if color.foreground
        @_dirs.right.color.background = color.background if color.background
      this
    else
      @_dirs.right

  down: ->
    if arguments.length
      @_dirs.down.style = arguments[0]
      if arguments.length > 1
        color = arguments[1]
        @_dirs.down.color.foreground = color.foreground if color.foreground
        @_dirs.down.color.background = color.background if color.background
      this
    else
      @_dirs.down

  toString: ->
    char: chooseCharacter
      left: @left().style
      up: @up().style
      right: @right().style
      down: @down().style
    color: chooseColor
      left: @left().color
      up: @up().color
      right: @right().color
      down: @down().color

module.exports = -> new Cell()
