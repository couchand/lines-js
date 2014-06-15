# sampler

lines = require '../src/lines'

eye = lines()
  .box
    from: [0, 0]
    to: [16, 9]
    style: 'double'
  .line
    from: [2, 0]
    to: [2, 9]
  .line
    from: [0, 1]
    to: [16, 1]
  .line
    from: [0, 8]
    to: [16, 8]
    style: 'bold'
  .line
    from: [14, 9]
    to: [14, 0]
    style: 'bold'
  .line
    from: [14, 2]
    to: [2, 2]
    style: 'bold'
  .line
    from: [4, 2]
    to: [4, 8]
    style: 'bold'
  .line
    from: [4, 7]
    to: [14, 7]
  .line
    from: [12, 7]
    to: [12, 2]
  .line
    from: [12, 3]
    to: [4, 3]
    style: 'double'
  .line
    from: [6, 3]
    to: [6, 7]
    style: 'double'
  .line
    from: [6, 6]
    to: [12, 6]
    style: 'bold'
  .line
    from: [10, 6]
    to: [10, 3]
    style: 'bold'
  .line
    from: [10, 4]
    to: [6, 4]
  .line
    from: [8, 4]
    to: [8, 6]
  .line
    from: [8, 5]
    to: [10, 5]
    style: 'double'

console.log eye.toString()

boxes = lines()
  .box
    from: [0, 0]
    to: [40, 3]
  .box
    from: [1, 1]
    to: [41, 4]
    style: 'bold'
  .box
    from: [2, 2]
    to: [42, 5]
    style: 'double'

  .line
    from: [6, 0]
    to: [6, 3]
  .line
    from: [9, 1]
    to: [9, 4]
  .line
    from: [12, 2]
    to: [12, 5]

  .line
    from: [18, 0]
    to: [18, 3]
    style: 'bold'
  .line
    from: [21, 1]
    to: [21, 4]
    style: 'bold'
  .line
    from: [24, 2]
    to: [24, 5]
    style: 'bold'

  .line
    from: [30, 0]
    to: [30, 3]
    style: 'double'
  .line
    from: [33, 1]
    to: [33, 4]
    style: 'double'
  .line
    from: [36, 2]
    to: [36, 5]
    style: 'double'

console.log boxes.toString()

squares = lines()
  .box
    from: [0, 0]
    to: [4, 2]
  .box
    from: [8, 4]
    to: [12, 6]
    style: 'bold'
  .box
    from: [16, 8]
    to: [20, 10]
    style: 'double'

  .line
    from: [8, 0]
    to: [8, 2]
  .line
    from: [12, 0]
    to: [12, 2]
  .line
    from: [16, 0]
    to: [16, 2]
  .line
    from: [20, 0]
    to: [20, 2]

  .line
    from: [0, 4]
    to: [4, 4]
  .line
    from: [0, 6]
    to: [4, 6]
  .line
    from: [0, 8]
    to: [4, 8]
  .line
    from: [0, 10]
    to: [4, 10]

  .line
    from: [8, 0]
    to: [12, 0]
    style: 'bold'
  .line
    from: [8, 2]
    to: [12, 2]
    style: 'bold'
  .line
    from: [8, 8]
    to: [12, 8]
    style: 'bold'
  .line
    from: [8, 10]
    to: [12, 10]
    style: 'bold'

  .line
    from: [0, 4]
    to: [0, 6]
    style: 'bold'
  .line
    from: [4, 4]
    to: [4, 6]
    style: 'bold'
  .line
    from: [16, 4]
    to: [16, 6]
    style: 'bold'
  .line
    from: [20, 4]
    to: [20, 6]
    style: 'bold'

  .line
    from: [16, 0]
    to: [20, 0]
    style: 'double'
  .line
    from: [16, 2]
    to: [20, 2]
    style: 'double'
  .line
    from: [16, 4]
    to: [20, 4]
    style: 'double'
  .line
    from: [16, 6]
    to: [20, 6]
    style: 'double'

  .line
    from: [0, 8]
    to: [0, 10]
    style: 'double'
  .line
    from: [4, 8]
    to: [4, 10]
    style: 'double'
  .line
    from: [8, 8]
    to: [8, 10]
    style: 'double'
  .line
    from: [12, 8]
    to: [12, 10]
    style: 'double'

console.log squares.toString()

hashes = lines()
  .line
    from: [2, 0]
    to: [2, 3]
  .line
    from: [4, 0]
    to: [4, 3]
  .line
    from: [0, 1]
    to: [6, 1]
  .line
    from: [0, 2]
    to: [6, 2]
  .box
    from: [2, 1]
    to: [4, 2]
    style: 'bold'

  .line
    from: [10, 0]
    to: [10, 3]
  .line
    from: [12, 0]
    to: [12, 3]
  .line
    from: [8, 1]
    to: [14, 1]
  .line
    from: [8, 2]
    to: [14, 2]
  .line
    from: [10, 1]
    to: [10, 2]
    style: 'bold'
  .line
    from: [12, 1]
    to: [12, 2]
    style: 'bold'

  .line
    from: [18, 0]
    to: [18, 3]
  .line
    from: [20, 0]
    to: [20, 3]
  .line
    from: [16, 1]
    to: [22, 1]
  .line
    from: [16, 2]
    to: [22, 2]
  .line
    from: [18, 1]
    to: [20, 1]
    style: 'bold'
  .line
    from: [18, 2]
    to: [20, 2]
    style: 'bold'

  .line
    from: [2, 4]
    to: [2, 7]
    style: 'bold'
  .line
    from: [4, 4]
    to: [4, 7]
    style: 'bold'
  .line
    from: [0, 5]
    to: [6, 5]
    style: 'bold'
  .line
    from: [0, 6]
    to: [6, 6]
    style: 'bold'
  .box
    from: [2, 5]
    to: [4, 6]

  .line
    from: [10, 4]
    to: [10, 7]
    style: 'bold'
  .line
    from: [12, 4]
    to: [12, 7]
    style: 'bold'
  .line
    from: [8, 5]
    to: [14, 5]
    style: 'bold'
  .line
    from: [8, 6]
    to: [14, 6]
    style: 'bold'
  .line
    from: [10, 5]
    to: [10, 6]
  .line
    from: [12, 5]
    to: [12, 6]

  .line
    from: [18, 4]
    to: [18, 7]
    style: 'bold'
  .line
    from: [20, 4]
    to: [20, 7]
    style: 'bold'
  .line
    from: [16, 5]
    to: [22, 5]
    style: 'bold'
  .line
    from: [16, 6]
    to: [22, 6]
    style: 'bold'
  .line
    from: [18, 5]
    to: [20, 5]
  .line
    from: [18, 6]
    to: [20, 6]

console.log hashes.toString()

dna = lines()
  .line
    from: [0, 0]
    to: [0, 6]
  .line
    from: [4, 0]
    to: [4, 6]
  .line
    from: [6, 0]
    to: [6, 6]
  .line
    from: [10, 0]
    to: [10, 6]
  .line
    from: [12, 0]
    to: [12, 6]
  .line
    from: [16, 0]
    to: [16, 6]

  .line
    from: [0, 1]
    to: [2, 1]
  .line
    from: [6, 1]
    to: [8, 1]
  .line
    from: [12, 1]
    to: [14, 1]
  .line
    from: [2, 1]
    to: [4, 1]
  .line
    from: [2, 3]
    to: [4, 3]
  .line
    from: [2, 5]
    to: [4, 5]

  .line
    from: [0, 3]
    to: [2, 3]
    style: 'bold'
  .line
    from: [6, 3]
    to: [8, 3]
    style: 'bold'
  .line
    from: [12, 3]
    to: [14, 3]
    style: 'bold'
  .line
    from: [8, 1]
    to: [10, 1]
    style: 'bold'
  .line
    from: [8, 3]
    to: [10, 3]
    style: 'bold'
  .line
    from: [8, 5]
    to: [10, 5]
    style: 'bold'

  .line
    from: [0, 5]
    to: [2, 5]
    style: 'double'
  .line
    from: [6, 5]
    to: [8, 5]
    style: 'double'
  .line
    from: [12, 5]
    to: [14, 5]
    style: 'double'
  .line
    from: [14, 1]
    to: [16, 1]
    style: 'double'
  .line
    from: [14, 3]
    to: [16, 3]
    style: 'double'
  .line
    from: [14, 5]
    to: [16, 5]
    style: 'double'

console.log dna.toString()
