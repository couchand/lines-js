# cell

# filed by left - up - right - down
chars =
  normal:
    normal:
      normal:
        normal: "┼"
        bold: "╁"
        none: "┴"
      bold:
        normal: "┾"
        bold: "╆"
        none: "┶"
      none:
        normal: "┤"
        bold: "┧"
        none: "┘"
    bold:
      normal:
        normal: "╀"
        bold: "╂"
        none: "┸"
      bold:
        normal: "╄"
        bold: "╊"
        none: "┺"
      none:
        normal: "┦"
        bold: "┨"
        none: "┚"
    none:
      normal:
        normal: "┬"
        bold: "┰"
        none: "─"
      bold:
        normal: "┮"
        bold: "┲"
        none: "╼"
      none:
        normal: "┐"
        bold: "┒"
        none: "╴"
  bold:
    normal:
      normal:
        normal: "┽"
        bold: "╅"
        none: "┵"
      bold:
        normal: "┿"
        bold: "╈"
        none: "┷"
      none:
        normal: "┥"
        bold: "┪"
        none: "┙"
    bold:
      normal:
        normal: "╃"
        bold: "╉"
        none: "┹"
      bold:
        normal: "╇"
        bold: "╋"
        none: "┻"
      none:
        normal: "┩"
        bold: "┫"
        none: "┛"
    none:
      normal:
        normal: "┭"
        bold: "┱"
        none: "╾"
      bold:
        normal: "┯"
        bold: "┳"
        none: "━"
      none:
        normal: "┑"
        bold: "┓"
        none: "╸"
  none:
    normal:
      normal:
        normal: "├"
        bold: "┟"
        none: "└"
      bold:
        normal: "┝"
        bold: "┢"
        none: "┕"
      none:
        normal: "│"
        bold: "╽"
        none: "╵"
    bold:
      normal:
        normal: "┞"
        bold: "┠"
        none: "┖"
      bold:
        normal: "┡"
        bold: "┣"
        none: "┗"
      none:
        normal: "╿"
        bold: "┃"
        none: "╹"
    none:
      normal:
        normal: "┌"
        bold: "┎"
        none: "╶"
      bold:
        normal: "┍"
        bold: "┏"
        none: "╺"
      none:
        normal: "╷"
        bold: "╻"
        none: " "

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
    chars[@left()][@up()][@right()][@down()]

module.exports = -> new Cell()
