#Remove all elements from a linked list of integers that have value val.
# Input:  1->2->6->3->4->5->6, val = 6
# Output: 1->2->3->4->5

class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class RemoveElements
  def remove_elements(head, val)
    return nil if head.nil?
    head.next = remove_elements(head.next, val)
    return head.val == val ? head.next : head
  end
end