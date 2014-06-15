# an example of a Funciton program

lines = require '../src'

calculateBox = (name, nw) ->
  se = [nw[0] + 3 + name.length, nw[1] + 2]
  sw = [nw[0], se[1]]
  ne = [se[0], nw[1]]
  {nw, se, sw, ne}

functionCall = (program, name, nw) ->
  {nw, se, sw, ne} = calculateBox name, nw
  program
    .line nw, sw
    .line nw, ne
    .line sw, se, "double"
    .line ne, se, "double"

functionDeclare = (program, name, nw) ->
  {nw, se, sw, ne} = calculateBox name, nw
  program
    .line nw, sw, "double"
    .line nw, ne
    .line sw, se
    .line ne, se, "double"

integerLiteral = (program, name, nw) ->
  {nw, se, sw, ne} = calculateBox name, nw
  program
    .box nw, se, "double"

addName = (str, name, nw) ->
  str
    .split '\n'
    .map (row, i) ->
      unless i is nw[1] + 1
        row
      else
        row[...nw[0] + 2] + name + row[nw[0] + 2 + name.length..]
    .join '\n'

functions = [
  { name: "+", position: [ 7,  6] }
  { name: "!", position: [ 7,  9] }
  { name: "×", position: [13, 12] }
  { name: "?", position: [19, 12] }
  { name: ">", position: [24,  2] }
]

literals = [
  { name: "-1", position: [ 0, 6] }
  { name:  "1", position: [19, 9] }
  { name:  "2", position: [30, 2] }
]

declarations = [
  { name: "!", position: [17, 0] }
]

all = functions.concat literals, declarations

factorial = lines()

functionCall factorial, name, position for {name, position} in functions
integerLiteral factorial, name, position for {name, position} in literals
functionDeclare factorial, name, position for {name, position} in declarations

factorial
  .line [ 5,  7], [ 7,  7]
  .line [ 9,  8], [ 9,  9]
  .line [ 9, 11], [ 9, 15]
  .line [ 9, 15], [15, 15]
  .line [15, 15], [15, 14]
  .line [11,  7], [15,  7]
  .line [15,  7], [15, 12]
  .line [17, 13], [19, 13]
  .line [21, 11], [21, 12]
  .line [21, 14], [21, 16]
  .line [23, 13], [26, 13]
  .line [26, 13], [26,  4]
  .line [28,  3], [30,  3]
  .line [24,  3], [13,  3]
  .line [13,  3], [13,  7]
  .line [19,  2], [19,  3]

rendered = factorial.toString()
rendered = addName rendered, name, position for {name, position} in all

console.log rendered
