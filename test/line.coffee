# line test

chai = require 'chai'
chai.should()

line = require '../src/line'

describe "Line", ->
  describe "constructor", ->
    it "requires from coordinates", ->
      line.should.throw /from/

    it "requires both from coordinates", ->
      (-> line
        from: [0]
      ).should.throw /from/

    it "requires to coordinates", ->
      (-> line
        from: [0, 1]
      ).should.throw /to/

    it "requires both to coordinates", ->
      (-> line
        from: [0, 1]
        to: [0]
      ).should.throw /to/

    it "rejects non-collinear coordinates", ->
      (-> line
        from: [0, 0]
        to: [1, 2]
      ).should.throw /collinear/

    it "rejects coincident coordinates", ->
      (-> line
        from: [4, 4]
        to: [4, 4]
      ).should.throw /coincident/

    it "allows coordinates sharing a row", ->
      (-> line
        from: [0, 0]
        to: [3, 0]
      ).should.not.throw

    it "allows coordinates sharing a col", ->
      (-> line
        from: [0, 0]
        to: [0, 3]
      ).should.not.throw

    it "defaults style to normal", ->
      l = line
        from: [0, 0]
        to: [0, 1]

      l.style.should.equal "normal"

    it "defaults foreground color to none", ->
      l = line
        from: [0, 0]
        to: [0, 1]

      l.color.foreground.should.equal "none"

    it "defaults background color to none", ->
      l = line
        from: [0, 0]
        to: [0, 1]

      l.color.background.should.equal "none"

    it "takes ordered parameters in concise version", ->
      l = line [0, 0], [1, 0], "bold", "red", "blue"

      l.from[0].should.equal 0
      l.to[0].should.equal 1
      l.style.should.equal "bold"
      l.color.foreground.should.equal "red"
      l.color.background.should.equal "blue"

  describe "horizontal", ->
    it "is true for coordinates sharing a row", ->
      l = line
        from: [0, 0]
        to: [3, 0]

      l.horizontal().should.equal yes

    it "is false for coordinates sharing a col", ->
      l = line
        from: [0, 0]
        to: [0, 3]

      l.horizontal().should.equal no

  describe "vertical", ->
    it "is true for coordinates sharing a col", ->
      l = line
        from: [0, 0]
        to: [0, 3]

      l.vertical().should.equal yes

    it "is false for coordinates sharing a row", ->
      l = line
        from: [0, 0]
        to: [3, 0]

      l.vertical().should.equal no
