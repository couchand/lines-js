# lines test

chai = require 'chai'
chai.should()

lines = require '../src/lines'

describe "lines", ->
  describe "line", ->
    it "adds lines in order", ->
      pic = lines()
        .line
          from: [0, 0]
          to: [1, 0]
        .line
          from: [1, 0]
          to: [1, 2]
        .line
          from: [2, 0]
          to: [2, 2]

      all = pic.lines()
      all.length.should.equal 3
      all[0].from[0].should.equal 0
      all[1].from[0].should.equal 1
      all[2].from[0].should.equal 2

  describe "box", ->
    it "adds four lines", ->
      x1 = 1
      x2 = 2
      y1 = 3
      y2 = 4

      pic = lines()
        .box
          from: [x1, y1]
          to: [x2, y2]
          style: "bold"

      sides = pic.lines()
      sides.length.should.equal 4

  describe "toString", ->
    it "stringifies horizontal lines", ->
      pic = lines()
        .line
          from: [0, 0]
          to: [1, 0]

      pic.toString().should.equal "╶╴"

    it "stringifies vertical lines", ->
      pic = lines()
        .line
          from: [1, 0]
          to: [1, 1]

      pic.toString().should.equal " ╷\n ╵"

    it "stringifies corners", ->
      pic = lines()
        .line
          from: [0, 0]
          to: [1, 0]
        .line
          from: [0, 0]
          to: [0, 1]

      pic.toString().should.equal "┌╴\n╵ "
