chai = require 'chai'

assert = chai.assert

suite 'Array', ->
  test 'popは最後の要素を取り除いて返す', ->
    array = ['a', 'b', 'c']
    assert.equal array.pop(), 'c'
    assert.deepEqual array, ['a', 'b']
