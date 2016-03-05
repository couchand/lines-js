# cell tests

chai = require 'chai'
chai.should()

cell = require '../src/cell'

describe "cell", ->
  me = beforeEach -> me = cell()

  describe "left", ->
    it "holds a style", ->
      me.left "foobar"
      me.left().style.should.equal "foobar"

    it "replaces the style", ->
      me.left "foobar"
      me.left "qux"
      me.left().style.should.equal "qux"

    it "holds a color", ->
      me.left "foobar", foreground: "baz"
      me.left().color.foreground.should.equal "baz"

    it "replaces the color", ->
      me.left "foobar", foreground: "baz"
      me.left "qux", foreground: "potato"
      me.left().color.foreground.should.equal "potato"

  describe "up", ->
    it "holds a style", ->
      me.up "foobar"
      me.up().style.should.equal "foobar"

    it "replaces the style", ->
      me.up "foobar"
      me.up "qux"
      me.up().style.should.equal "qux"

    it "holds a color", ->
      me.up "foobar", foreground: "baz"
      me.up().color.foreground.should.equal "baz"

    it "replaces the color", ->
      me.up "foobar", foreground: "baz"
      me.up "qux", foreground: "potato"
      me.up().color.foreground.should.equal "potato"

  describe "right", ->
    it "holds a style", ->
      me.right "foobar"
      me.right().style.should.equal "foobar"

    it "replaces the style", ->
      me.right "foobar"
      me.right "qux"
      me.right().style.should.equal "qux"

    it "holds a color", ->
      me.right "foobar", foreground: "baz"
      me.right().color.foreground.should.equal "baz"

    it "replaces the color", ->
      me.right "foobar", foreground: "baz"
      me.right "qux", foreground: "potato"
      me.right().color.foreground.should.equal "potato"

  describe "down", ->
    it "holds a style", ->
      me.down "foobar"
      me.down().style.should.equal "foobar"

    it "replaces the style", ->
      me.down "foobar"
      me.down "qux"
      me.down().style.should.equal "qux"

    it "holds a color", ->
      me.down "foobar", foreground: "baz"
      me.down().color.foreground.should.equal "baz"

    it "replaces the color", ->
      me.down "foobar", foreground: "baz"
      me.down "qux", foreground: "potato"
      me.down().color.foreground.should.equal "potato"

  describe "toString", ->
    it "converts the cell to a box-drawing character", ->
      me
        .left "normal"
        .up "bold"
        .right "normal"
        .toString()
        .char.should.equal "┸"

    it "chooses colors", ->
      color = me
        .left "normal",
          foreground: "red"
          background: "white"
        .right "normal",
          foreground: "blue"
          background: "white"
        .up "normal",
          foreground: "red"
          background: "black"
        .toString()
        .color

      color.foreground.should.equal "red"
      color.background.should.equal "white"
