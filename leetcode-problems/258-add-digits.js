/**
 * Recursive solution
 * Runtime: 108 ms, faster than 29.50% of JavaScript online submissions for Add Digits.
 * Memory Usage: 40.9 MB, less than 10.69% of JavaScript online submissions for Add Digits.
 *
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  function addRecursive(num) {
    if (num < 10) {
      return num;
    } else {
      var arr = String(num).split('');
      var newNum = arr.reduce((a, b) => Number(a) + Number(b), 0);
      return addRecursive(newNum); 
    }
  }
  return addRecursive(num);
};

/**
 * While loop with string solution
 * Runtime: 104 ms, faster than 42.77% of JavaScript online submissions for Add Digits.
 * Memory Usage: 40.4 MB, less than 31.88% of JavaScript online submissions for Add Digits.
 * 
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  while(num >= 10) {
    num = String(num).split('').reduce((a, b) => Number(a) + Number(b), 0);
  }
  return num;
};

/**
 * While loop with division by 10 solution
 * Runtime: 112 ms, faster than 23.96% of JavaScript online submissions for Add Digits.
 * Memory Usage: 40.1 MB, less than 53.47% of JavaScript online submissions for Add Digits.
 * 
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  while (num >= 10) {
    var sum = 0;
    while (num) {
      sum += num % 10;
      num = Math.floor(num / 10);
    }
    num = sum;
  }
  return num;
};

/**
 * Digital root solution
 * Runtime: 96 ms, faster than 77.23% of JavaScript online submissions for Add Digits.
 * Memory Usage: 40 MB, less than 65.15% of JavaScript online submissions for Add Digits.
 * 
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  return 1 + (num - 1) % 9;
};

console.log(addDigits(38));
console.log(addDigits(0));