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
    .line
      from: nw
      to: sw
    .line
      from: nw
      to: ne
    .line
      from: sw
      to: se
      style: "double"
    .line
      from: ne
      to: se
      style: "double"

functionDeclare = (program, name, nw) ->
  {nw, se, sw, ne} = calculateBox name, nw
  program
    .line
      from: nw
      to: sw
      style: "double"
    .line
      from: nw
      to: ne
    .line
      from: sw
      to: se
    .line
      from: ne
      to: se
      style: "double"

integerLiteral = (program, name, nw) ->
  {nw, se, sw, ne} = calculateBox name, nw
  program
    .box
      from: nw
      to: se
      style: "double"

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
  .line from: [ 5,  7], to: [ 7,  7]
  .line from: [ 9,  8], to: [ 9,  9]
  .line from: [ 9, 11], to: [ 9, 15]
  .line from: [ 9, 15], to: [15, 15]
  .line from: [15, 15], to: [15, 14]
  .line from: [11,  7], to: [15,  7]
  .line from: [15,  7], to: [15, 12]
  .line from: [17, 13], to: [19, 13]
  .line from: [21, 11], to: [21, 12]
  .line from: [21, 14], to: [21, 16]
  .line from: [23, 13], to: [26, 13]
  .line from: [26, 13], to: [26,  4]
  .line from: [28,  3], to: [30,  3]
  .line from: [24,  3], to: [13,  3]
  .line from: [13,  3], to: [13,  7]
  .line from: [19,  2], to: [19,  3]

rendered = factorial.toString()
rendered = addName rendered, name, position for {name, position} in all

console.log rendered
