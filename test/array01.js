var chai = require('chai');

var assert = chai.assert;

suite('Array', function () {
    test('popは最後の要素を取り除いて返す', function() {
        var array = ['a', 'b', 'c'];
        assert.equal(array.pop(), 'c');
        assert.deepEqual(array, ['a', 'b']);
    });
});
