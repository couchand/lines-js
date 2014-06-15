# lines-js logo

lines = require '../src/lines'

logo = lines()
  .box
    from: [0, 0]
    to: [40, 10]
    style: 'rounded'
  .line
    from: [2, 0]
    to: [2, 14]
    style: 'bold'
  .line
    from: [38, 0]
    to: [38, 10]
    style: 'bold'
  .line
    from: [0, 1]
    to: [40, 1]
    style: 'bold'
  .line
    from: [0, 9]
    to: [40, 9]
    style: 'bold'
  .line
    from: [2, 5]
    to: [38, 5]
  .box
    from: [4, 2]
    to: [13, 4]
    style: 'double'
  .line
    from: [2, 12]
    to: [4, 12]
    style: 'bold'
  .line
    from: [2, 13]
    to: [4, 13]
    style: 'bold'
  .line
    from: [2, 14]
    to: [4, 14]
    style: 'bold'

console.log logo.toString()
