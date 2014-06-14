# plaid example

lines = require '../src/lines'

plaid = lines()
  .box
    from: [0, 0]
    to: [16, 6]

# warp
  .line
    from: [1, 0]
    to: [1, 6]
    style: 'bold'
  .line
    from: [2, 0]
    to: [2, 6]
  .line
    from: [4, 0]
    to: [4, 6]
  .line
    from: [5, 0]
    to: [5, 6]
    style: 'double'
  .line
    from: [6, 0]
    to: [6, 6]
  .line
    from: [8, 0]
    to: [8, 6]
  .line
    from: [9, 0]
    to: [9, 6]
    style: 'bold'
  .line
    from: [10, 0]
    to: [10, 6]
  .line
    from: [12, 0]
    to: [12, 6]
  .line
    from: [13, 0]
    to: [13, 6]
    style: 'double'
  .line
    from: [14, 0]
    to: [14, 6]

# weft
  .line
    from: [0, 1]
    to: [16, 1]
    style: 'bold'
  .line
    from: [0, 2]
    to: [16, 2]
    style: 'double'
  .line
    from: [0, 3]
    to: [16, 3]
  .line
    from: [0, 4]
    to: [16, 4]
    style: 'bold'
  .line
    from: [0, 5]
    to: [16, 5]
    style: 'double'

console.log plaid.toString()
