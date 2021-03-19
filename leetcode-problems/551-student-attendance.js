/**
 * Straightforward solution
 * Runtime: 80 ms, faster than 66.80% of JavaScript online submissions for Student Attendance Record I.
 * Memory Usage: 38.5 MB, less than 84.94% of JavaScript online submissions for Student Attendance Record I.
 * 
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  return ((s.match(/A/g) || []).length < 2) && (s.indexOf('LLL') === -1);
};

/**
 * lastIndexOf solution
 * Runtime: 80 ms, faster than 66.80% of JavaScript online submissions for Student Attendance Record I.
 * Memory Usage: 38.5 MB, less than 84.94% of JavaScript online submissions for Student Attendance Record I.
 * 
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  return (s.indexOf('A') === s.lastIndexOf('A')) && (s.indexOf('LLL') === -1);
};

/**
 * Includes solution
 * Runtime: 80 ms, faster than 66.80% of JavaScript online submissions for Student Attendance Record I.
 * Memory Usage: 38.5 MB, less than 91.12% of JavaScript online submissions for Student Attendance Record I.
 * 
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  return (s.indexOf('A') === s.lastIndexOf('A')) && !s.includes('LLL');
};

/**
 * Includes with split-filter solution
 * Runtime: 72 ms, faster than 96.14% of JavaScript online submissions for Student Attendance Record I.
 * Memory Usage: 38.6 MB, less than 84.94% of JavaScript online submissions for Student Attendance Record I.
 * 
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  return s.split("").filter(s => s == "A").length <= 1 && !s.includes('LLL');
};

/**
 * Regex-only solution
 * Runtime: 80 ms, faster than 66.80% of JavaScript online submissions for Student Attendance Record I.
 * Memory Usage: 37.8 MB, less than 99.23% of JavaScript online submissions for Student Attendance Record I.
 * 
 * @param {string} s
 * @return {boolean}
 */
var checkRecord = function(s) {
  return !/^.*(A.*A|L{3,}).*$/.test(s);
};

console.log(checkRecord('PPALLP'));
console.log(checkRecord('PPALLL'));