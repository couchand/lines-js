# sorting example example

charm = require 'charm'
lines = require '../lib'

term = charm()
term.pipe process.stdout

# generate data
data = [1..10]

for index, value of data when +index isnt data.length - 1
  j = +index + Math.floor Math.random() * (data.length - +index)
  data[+index] = data[j]
  data[j] = value

# draw lines
draw = (a, b) ->
  pic = lines()
  
  for index, value of data
    style = switch +index
      when a then 'bold'
      when b then 'double'
      else 'normal'
    pic.line [+index, 10], [+index, 10-value], style
  
  term.erase 'screen'
  term.position 0, 0
  term.write pic.toString()

draw()

# sort
swap = (a, b) ->
  element = data[a]
  data[a] = data[b]
  data[b] = element

step = (i) ->
  return finish() if i >= data.length
  next = (k) ->
    return step i + 1 unless k > 0 and data[k] < data[k-1]
    draw i, k
    swap k, k-1
    setTimeout (-> next k - 1), 200
  setTimeout (-> next i), 200

step 1

finish = ->
  draw()
  term.end '\n'
