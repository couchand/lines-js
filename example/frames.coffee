# a basic example

lines = require '../src/lines'

split = lines()

# outer frame
  .line
    from: [0, 0]
    to: [8, 0]
  .line
    from: [0, 6]
    to: [8, 6]
  .line
    from: [0, 0]
    to: [0, 6]
    style: "bold"
  .line
    from: [8, 0]
    to: [8, 6]
    style: "bold"

# split
  .line
    from: [0, 3]
    to: [8, 3]
    style: "bold"

# upper panes
  .line
    from: [2, 0]
    to: [2, 3]
  .line
    from: [4, 0]
    to: [4, 3]
  .line
    from: [6, 0]
    to: [6, 3]

console.log split.toString()

traditional = lines()

# main casement
  .box
    from: [6, 0]
    to: [32, 13]
    style: 'bold'
  .box
    from: [7, 1]
    to: [31, 12]
  .line
    from: [7, 12]
    to: [31, 12]
    style: 'bold'
  .line
    from: [19, 1]
    to: [19, 12]
    style: 'bold'

# left window
  .box
    from: [9, 2]
    to: [13, 11]
  .box
    from: [13, 2]
    to: [17, 11]

  .line
    from: [9, 5]
    to: [17, 5]
  .line
    from: [9, 8]
    to: [17, 8]

# right window
  .box
    from: [21, 2]
    to: [25, 11]
  .box
    from: [25, 2]
    to: [29, 11]

  .line
    from: [21, 5]
    to: [29, 5]
  .line
    from: [21, 8]
    to: [29, 8]

# left shutter
  .box
    from: [0, 1]
    to: [6, 11]
  .box
    from: [1, 2]
    to: [5, 10]
    style: 'bold'

  .line
    from: [1, 4]
    to: [5, 4]
  .line
    from: [1, 6]
    to: [5, 6]
  .line
    from: [1, 8]
    to: [5, 8]

# right shutter
  .box
    from: [32, 1]
    to: [38, 11]
  .box
    from: [33, 2]
    to: [37, 10]
    style: 'bold'

  .line
    from: [33, 4]
    to: [37, 4]
  .line
    from: [33, 6]
    to: [37, 6]
  .line
    from: [33, 8]
    to: [37, 8]

console.log traditional.toString()

bay = lines()

# cornice
  .box
    from: [1, 0]
    to: [34, 1]
    style: 'bold'
  .line
    from: [0, 0]
    to: [35, 0]
  .line
    from: [3, 2]
    to: [32, 2]
  .line
    from: [3, 0]
    to: [3, 12]
  .line
    from: [32, 0]
    to: [32, 12]
  .line
    from: [3, 12]
    to: [32, 12]
    style: 'bold'

# bay
  .line
    from: [12, 0]
    to: [12, 12]
    style: 'bold'
  .line
    from: [23, 0]
    to: [23, 12]
    style: 'bold'

# windows
  .box
    from: [4, 3]
    to: [11, 11]
  .box
    from: [13, 3]
    to: [22, 11]
  .box
    from: [24, 3]
    to: [31, 11]
  .line
    from: [4, 7]
    to: [11, 7]
    style: 'bold'
  .line
    from: [13, 7]
    to: [22, 7]
    style: 'bold'
  .line
    from: [24, 7]
    to: [31, 7]
    style: 'bold'

console.log bay.toString()
