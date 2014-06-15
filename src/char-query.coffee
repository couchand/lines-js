# a better character map

chars = [
  [
    [' ╷╻', '╶┌┎', '╺┍┏']
    ['╵│╽', '└├┟', '┕┝┢']
    ['╹╿┃', '┖┞┠', '┗┡┣']
  ]
  [
    ['╴┐┒', '─┬┰', '╼┮┲']
    ['┘┤┧', '┴┼╁', '┶┾╆']
    ['┚┦┨', '┸╀╂', '┺╄╊']
  ]
  [
    ['╸┑┓', '╾┭┱', '━┯┳']
    ['┙┥┪', '┵┽╅', '┷┿╈']
    ['┛┩┫', '┹╃╉', '┻╇╋']
  ]
]

chars = for left in chars
  for up in left
    for right in up
      down = right.split ''
      for char in down
        default: char

chars[0][0][1][1].rounded = '╭'
chars[0][1][1][0].rounded = '╰'
chars[1][1][0][0].rounded = '╯'
chars[1][0][0][1].rounded = '╮'

chars[0][0][1][2].double = '╓'
chars[0][0][2][1].double = '╒'
chars[0][0][2][2].double = '╔'
chars[0][1][2][0].double = '╘'
chars[0][1][2][1].double = '╞'
chars[0][2][0][2].double = '║'
chars[0][2][1][0].double = '╙'
chars[0][2][1][2].double = '╟'
chars[0][2][2][0].double = '╚'
chars[0][2][2][2].double = '╠'

chars[1][0][0][2].double = '╖'
chars[1][0][1][2].double = '╥'
chars[1][2][0][0].double = '╜'
chars[1][2][0][2].double = '╢'
chars[1][2][1][0].double = '╨'
chars[1][2][1][2].double = '╫'

chars[2][0][0][1].double = '╕'
chars[2][0][0][2].double = '╗'
chars[2][0][2][0].double = '═'
chars[2][0][2][1].double = '╤'
chars[2][0][2][2].double = '╦'
chars[2][1][0][0].double = '╛'
chars[2][1][0][1].double = '╡'
chars[2][1][2][0].double = '╧'
chars[2][1][2][1].double = '╪'
chars[2][2][0][0].double = '╝'
chars[2][2][0][2].double = '╣'
chars[2][2][2][0].double = '╩'
chars[2][2][2][2].double = '╬'

width = (style) ->
  switch style
    when 'normal', 'rounded' then 1
    when 'bold', 'double'    then 2
    else 0

preferred = ({left, up, right, down}) ->
  counts = {}
  for style in [left, up, right, down] when style not in ['none', 'normal']
    counts[style] ?= 0
    counts[style] += 1
  max = 0
  maxes = no
  for style, count of counts
    return style if count is 3
    if count > max
      max = count
      maxes = [style]
    else if count is max
      maxes = maxes.concat [style]
  if max is 2
    unless maxes.length is 2
      return maxes[0]
    else
      down
  if down in maxes
    return down
  else if up in maxes
    return up
  else if right in maxes
    return right
  else if left in maxes
    return left
  'normal'

module.exports = ({left, up, right, down}) ->
  left ?=  'none'
  up ?=    'none'
  right ?= 'none'
  down ?=  'none'

  styles = {}
  for style in [left, up, right, down] when style isnt 'none'
    styles[style] ?= 0
    styles[style] += 1

  options = chars[width left][width up][width right][width down]

  opt = preferred({left, up, right, down})
  if opt of options
    options[opt]
  else
    options.default
