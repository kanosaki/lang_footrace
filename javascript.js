
var util = require('util');
var console = require('console');

var stdin = process.openStdin();

// class Solver {{{
var Solver = function(){
    this.memo = {};
};

Solver.prototype.solve = function(n){
    var ret = 0;
    if (n == 2) { ret = 1; start = 3; }
    else if (n % 2 == 0){
        start = n + 1;
    } else {
        start = n + 2;
    }

    for (var i = start; i < n * 2; i += 2) {
        if (this.is_prime(i)) {
            ret += 1;
        }
    };
    return ret;
}

//Solver.prototype.is_prime = function(n){
//    if (this.memo[n]) {
//        return true;
//    } else {
//        var result = this.is_prime_raw(n);
//        if (result) {
//            this.memo[n] = true;
//        }
//        return result;
//    }
//};

Solver.prototype.is_prime = function(n){
    if (n < 2) {return false;}
    if (n == 2) {return true;}
    if (n % 2 == 0) {return false;}
    for (var i = 3; i * i <= n; i += 2) {
        if (n % i == 0) { return false; }
    };
    return true;
};
//}}}

solver = new Solver();

stdin.resume();
stdin.setEncoding('utf-8');
stdin.on('data', function(chunk){
    chunk.trim().split('\n').forEach(function(line) {
        var num = parseInt(line);
        if (num == 0) {
            return;
        }
        var result = solver.solve(num);
        console.log(result);
    });
});
