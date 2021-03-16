/**
 * @param {number[][]} rectangles
 * @return {number}
 */
var countGoodRectangles = function(rectangles) {
  var count = 0;
  var largest = 0;
  for (var i = 0; i < rectangles.length; i++) {
    var largestHere = Math.min(...rectangles[i]);
    if (largestHere > largest) {
      largest = largestHere;
      count = 1;
    } else if (largestHere === largest) {
      count++;
    }
  }
  return count;
};

console.log(countGoodRectangles([[5,8],[3,9],[5,12],[16,5]]));
console.log(countGoodRectangles([[2,3],[3,7],[4,3],[3,7]]));