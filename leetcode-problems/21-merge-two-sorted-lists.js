/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 * 
 * Runtime: 80 ms, faster than 98.29% of JavaScript online submissions for Merge Two Sorted Lists.
 * Memory Usage: 40.6 MB, less than 24.90% of JavaScript online submissions for Merge Two Sorted Lists.
 */
var mergeTwoLists = function(l1, l2) {
  if (!l1 || !l2) return (l1 ? l1 :l2);
  if (l1.val < l2.val) {
    l1.next = mergeTwoLists(l1.next, l2);
    return l1;
  } else {
    l2.next = mergeTwoLists(l1, l2.next);
    return l2;
  }
};
