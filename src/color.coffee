# terminal colors

style = require 'ansi-styles'

bgize = (color) ->
  'bg' + color[0].toUpperCase() + color[1..]

module.exports =
  foreground: (color) ->
    switch color
      when 'none'
        return style.color.close

      else
        if color of style.color
          return style.color[color].open

    ''

  background: (color) ->
    switch color
      when 'none'
        return style.bgColor.close

      else
        bgColor = bgize color
        if bgColor of style.bgColor
          return style.bgColor[bgColor].open

    ''
