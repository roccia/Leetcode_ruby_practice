#Sort a linked list in O(n log n) time using constant space complexity.

# MergeSort(headRef)
# 1) If head is NULL or there is only one element in the Linked List
# then return.
#     2) Else divide the linked list into two halves.
#     FrontBackSplit(head, &a, &b); /* a and b are two halves */
# 3) Sort the two halves a and b.
#     MergeSort(a);
# MergeSort(b);
# 4) Merge the sorted a and b (using SortedMerge() discussed here)
# and update the head pointer using headRef.
#     *headRef = SortedMerge(a, b);

class MergeSort < Node
  def sort(head)
    return nil if head.nil? || !head.next?
    middle = get_middle(head)
    next_of_middle = middle.next
    middle.next = nil
    left = sort(head)
    right = sort(next_of_middle)
    list = merge(left, right)
    list
  end

  def merge(left, right)
    return right if left.nil?
    return left if right.nil?
    if left.value <= right.value
      result = left
      result.next = merge(left.next, right)
    else
      result = right
      result.next = merge(left, right.next)
    end
  end

  def get_middle(node)
    return node if node.nil?
    fast = node.next
    slow = node
    while !fast.nil?
      fast = fast.next
      if !fast.nil?
        slow = slow.next
        fast = fast.next
      end
    end
    slow
  end


end