# cell tests

chai = require 'chai'
chai.should()

cell = require '../src/cell'

describe "cell", ->
  me = beforeEach -> me = cell()

  describe "left", ->
    it "holds a value", ->
      me.left "foobar"
      me.left().should.equal "foobar"

    it "replaces the value", ->
      me.left "foobar"
      me.left "qux"
      me.left().should.equal "qux"

  describe "up", ->
    it "holds a value", ->
      me.up "foobar"
      me.up().should.equal "foobar"

    it "replaces the value", ->
      me.up "foobar"
      me.up "qux"
      me.up().should.equal "qux"

  describe "right", ->
    it "holds a value", ->
      me.right "foobar"
      me.right().should.equal "foobar"

    it "replaces the value", ->
      me.right "foobar"
      me.right "qux"
      me.right().should.equal "qux"

  describe "down", ->
    it "holds a value", ->
      me.down "foobar"
      me.down().should.equal "foobar"

    it "replaces the value", ->
      me.down "foobar"
      me.down "qux"
      me.down().should.equal "qux"

  describe "toString", ->
    it "converts the cell to a box-drawing character", ->
      me
        .left "normal"
        .up "bold"
        .right "normal"
        .toString()
        .should.equal "┸"
