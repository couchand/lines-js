```
╭─┰───────────────────────────────────┰─╮
┝━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━┥
│ ┃ ╔════════╗                        ┃ │
│ ┃ ║lines-js║                        ┃ │
│ ┃ ╚════════╝                        ┃ │
│ ┠───────────────────────────────────┨ │
│ ┃                                   ┃ │
│ ┃ console line drawing with unicode ┃ │
│ ┃                                   ┃ │
┝━╋━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━┥
╰─╂───────────────────────────────────┸─╯
  ┃
  ┣━╸introduction
  ┣━╸getting started
  ┗━╸documentation
```

introduction
------------

`lines-js` is a little JavaScript library to aid in drawing lines with
the Unicode box drawing characters.  Use it for console-based user
interfaces, console art, or to build a [Funciton][0] compiler.

```javascript
// tee.js
lines = require('lines-js');

tee = lines()
    .line({
        from: [0, 0],
        to: [4, 0],
        style: 'bold'
    })
    .line({
        from: [2, 0],
        to: [2, 3]
    });

console.log(tee.toString());
```

```bash
> node tee.js

╺━┯━╸
  │
  │
  ╵
```

getting started
---------------

Install `lines-js` from npm with a simple

```bash
npm install --save lines-js
```

Start drawing lines.  See the `examples` folder for ideas.

documentation
-------------

  * input
  * output

### input ###

The interface is simple, since there aren't many options available.
You pick:

  * the endpoints of each line
  * the line style
  * the foreground and background colors

Notably, the endpoints must lie on the same row or column, since the
character set only supports horizontal and vertical lines (no diagonal
lines yet).

The available styles are:

  * └ `normal` - the default
  * ┗ `bold`
  * ╚ `double`
  * ╰ `rounded`

Not every style is supported for every possible intersection.  The
best approximation is picked if the exact character is not available.

Colors are handled by the `ansi-styles` module.  Only 16 color mode
is supported, currently.

Two methods are exposed to add lines to the view, `line` and `box`.
Use `box` when you'd like to draw four lines with the same style for
a box.  Use `line` for complete control of each segment.

Both take the same parameters:

  * `from`
  * `to`
  * `style`
  * `color`
    * `foreground`
    * `background`

where `from` and `to` are the two coordinates defining the shape and
`style` is the display style for the line or box.  `color.foreground`
and `color.background` determine the foreground and background colors,
respectively.

The restrictions on `from` and `to` for lines are that they

  * must share a column or a row, and
  * must not be the same point.

The restriction on them for boxes is that they

  * must not share a row or a column.

### output ###

Call `toString` to convert the drawing to a unicode string suitable
for outputting to the console.  The canvas is automatically sized to
include all non-negative coordinates, so the length of the result
will be `R * (C + 1)` characters, where `R` is the maximum row and
`C` the maximum column.  The extra character per line is, of course,
the newline.

The `lines()` instance is also a stream, so pipe it somewhere!  See
the `sorting` example for details.

##### ╭╮☲☲☲╭╮ #####

[0]: http://esolangs.org/wiki/Funciton
