lines = require('../lib');

tee = lines()
    .line({
        from: [0, 0],
        to: [4, 0],
        style: 'bold'
    })
    .line({
        from: [2, 0],
        to: [2, 3]
    });

console.log(tee.toString());

