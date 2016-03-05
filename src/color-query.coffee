# choose a color

module.exports = ({left, up, right, down}) ->
  left ?=  {}
  up ?=    {}
  right ?= {}
  down ?=  {}
  left.foreground ?=  'none'
  up.foreground ?=    'none'
  right.foreground ?= 'none'
  down.foreground ?=  'none'
  left.background ?=  'none'
  up.background ?=    'none'
  right.background ?= 'none'
  down.background ?=  'none'

  colors =
    foreground: {}
    background: {}
  for color in [left, up, right, down]
    if color.foreground isnt 'none'
      colors.foreground[color.foreground] ?= 0
      colors.foreground[color.foreground] += 1
    if color.background isnt 'none'
      colors.background[color.background] ?= 0
      colors.background[color.background] += 1

  max =
    foreground: 0
    background: 0
  maxes =
    foreground: []
    background: []
  
  for color, count of colors.foreground when color isnt 'none'
    if count > max.foreground
      max.foreground = count
      maxes.foreground = [color]
    if count is max.foreground
      maxes.foreground.push color

  for color, count of colors.background when color isnt 'none'
    if count > max.background
      max.background = count
      maxes.background = [color]
    if count is max.background
      maxes.background.push color

  foreground = 'none'
  background = 'none'

  if maxes.foreground.length > 0
    foreground = maxes.foreground[0]
  if maxes.background.length > 0
    background = maxes.background[0]

  { foreground, background }
