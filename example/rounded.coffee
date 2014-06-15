# rounded corners example

lines = require '../src/lines'

rounded = lines()
  .box
    from: [0, 0]
    to: [10, 5]
    style: 'rounded'
  .box
    from: [2, 1]
    to: [8, 4]
    style: 'rounded'
  .box
    from: [4, 2]
    to: [6, 3]
    style: 'rounded'

console.log rounded.toString()
