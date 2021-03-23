/*
Runtime: 76 ms, faster than 73.90% of JavaScript online submissions for N-th Tribonacci Number.
Memory Usage: 38.3 MB, less than 63.84% of JavaScript online submissions for N-th Tribonacci Number.
*/

const memo = [0, 1, 1];
var tribonacci = function(n) {
    if (memo[n] !== undefined) return memo[n];
    memo[n] = tribonacci(n-3) + tribonacci(n-2) + tribonacci(n-1);
    return  memo[n];
};

console.log(tribonacci(4));
console.log(tribonacci(25));
console.log(tribonacci(35));