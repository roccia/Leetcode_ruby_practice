class TreeNode
  attr_accessor :val,:left,:right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end

  def next?
    !@next.nil?
  end
end

class LinkedList < Node
  attr_accessor :head

  def initialize(value)
    @head = Node.new(value, nil)
  end

  def add(value)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(value, nil)
  end

  def delete(value)
    if @head.value == value
      @head = @head.next
    else
      while (@head.next?) && (@head.next.value != value)
        @head = @head.next
      end
      unless @head.next?
      end
    end
  end

  def sort(head)
    return head if (head.nil? || !head.next?)
    middle = get_middle(head) #get the middle of the list
    next_of_middle = middle.next
    middle.next = nil #set the next of middle node to null
    left = sort(head)
    right = sort(next_of_middle)
    merge1(left, right)
  end

  def merge1(left, right)
    return right if left.nil?
    return left if right.nil?
    #Pick either left or right, and recur
    if left.value <= right.value
      result = left
      result.next = merge(left.next, right)
    else
      result = right
      result.next = merge(left, right.next)
    end
    result
  end

  #对单链表进行归并排序：首先设置两个指针slow和fast，slow指针每次走一步，
  # fast指针每次走两步，当fast指向末尾元素或者指向空时，
  # slow指针刚好走到链表的中间位置，此时slow指针恰好把链表分为左右两部分，
  # slow->next指针指向第二部分的首部，然后我们递归的对两部分进行划分操作，
  # 最后划分到两部分都只有一个元素时，我们对其进行合并操作，
  # 然后依次递归的向上进行归并操作。时间复杂度为o(nlogn)。

  def get_middle(head)
    return head if head.nil?
    fast = head.next
    slow = head
    # Move fast by two and slow ptr by one
    #Finally slow  will point to middle node

    while !fast.nil?
      fast = fast.next
      if !fast.nil?
        slow = slow.next #第二部分的首部
        fast = fast.next

      end
    end
    slow

  end

  def find_node(value)
    current_node = @head
    while !current_node.nil?
      return current_node if current_node.value == value
      current_node = current_node.next
    end
    'can not find '
  end


  def swap(head)
    if head && head.next
      next_node = head.next
      head.next = swap(next_node.next)
      next_node.next = head
      next_node
    end
    head
  end


  def reverse_list
    current_node = @head
    prev_node = nil
    while current_node
      next_node = current_node.next
      current_node.next = prev_node
      prev_node = current_node
      current_node = next_node
    end
    prev_node
  end

  def reverse_list_recursive(node=@head, prev=nil)
    if !node
      @head = prev
    else
      next_node = node.next
      node.next = prev
      reverse_list_recursive(next_node, node)
    end
  end

  def add_two_numbers(l1, l2)
    dummy = result = ListNode.new(carry = 0)
    while l1 && l2
      tmp = l1.val + l2.val + carry
      carry = tmp >9 ? 1 : 0
      value = tmp >9 ? tmp - 10 : tmp

      result.next = ListNode.new(value)
      result = result.next
      l1 = l1.next
      l2 = l2.next
    end

    if carry == 0
      result.next = l1 || l2
    else
      result.next = add_two_numbers(l1||l2, ListNode.new(1))
    end
    dummy.next

  end


  #Merge k sorted linked lists and return it as one sorted list.
  # Analyze and describe its complexity.

  # Time complexity : )O(Nlogk) where k is the number of linked lists.
  #
  #     We can merge two sorted linked list in O(n)time where n is the total number of nodes
  #     in two lists.
  #     Sum up the merge process and we can get:O(Nlogk)
  # Space complexity : O(1) We can merge two sorted linked lists in O(1)space.


  def merge_k_lists(lists)
    len = lists.size
    return lists[0] if len == 1
    interval = 1
    while interval < len
      (0..len).step(interval*2) do |i|
        lists[i] = merge(lists[i], lists[i+interval])
      end
      interval *= 2
    end
    lists[0]
  end

  def merge(l1, l2)
    head = point = Node.new(0)
    while l1 && l2
      if l1.value <= l2.value
        point.next = l1
        l1 = l1.next

      else
        point.next = l2
        l2 = l1
        l1 = point.next.next
      end
      point = point.next
    end
    if !l1
      point.next = l2
    else
      point.next = l1
    end

    head.next
  end

  # Traverse all the linked lists and collect the values of the nodes into an array.
  # Sort and iterate over this array to get the proper value of nodes.
  # Create a new sorted linked list and extend it with the new nodes.
  # O(nlogn)
  def merge_k_lists_1(lists)
    return [] if lists.length == 0

    merged = []

    lists.each do |list|
      node = list

      until node.nil? || node.value.nil?
        merged << node.value
        node = node.next
      end
    end

    merged.sort
  end

  def print_list
    result = []
    current = @head
    while !current.nil?
      result << current.value
      current = current.next
    end
    result
  end

  def remove_dup(head)
    current = head

    while !current.nil? && !current.next.nil?
       if current.next.value == current.value
          current.next = current.next.next
       else
         current = current.next
       end
    end
    head
  end

  def sorted_list_to_bst(head)
    if !head
      return
    end
    if !head.next
      return TreeNode.new(head.val)
    end
    slow, fast = head, head.next.next
    while fast and fast.next
      fast = fast.next.next
      slow = slow.next
    end
    mid = slow.next
    slow.next = nil
    root = TreeNode.new(mid.val)
    root.left = sorted_list_to_bst(head)
    root.right = sorted_list_to_bst(mid.next)
    root
  end

  def is_palindrome(head)
     fast = slow = head
     #find mid
     while fast && fast.next
       fast = fast.next.next
       slow = slow.next
     end
     second_half = nil
     # reverse second half
     while slow
         nxt = slow.next
         slow.next = second_half
         second_half = slow
         slow = nxt
     end

     #compare
     while second_half && head
         if second_half.val != head.val
            return false
         end
         second_half = second_half.next
         head = head.next
     end
       true
  end


end


list1 = LinkedList.new(1)
list1.add(2)
list1.add(3)
list1.add(4)
list1.add(5)
#p list1.remove_dup(list1.head)
p list1.get_middle(list1.head)
p list1.sorted_list_to_bst(list1.head)
#p list1.reverse_list

# p list1.reverse_list
# list2 = LinkedList.new
# list2.add(1)
# list2.add(6)
# list2.add(11)
# list2.add(16)
# list2.add(21)
# list2.add(26)
# head2 = list2.head
#
# #list1.print_list(head1)
# #list2.print_list(head2)
# list1.head = list1.sort(head1)
# list2.head = list2.sort(head2)
# p list1.print_list(list1.head)
# p list2.print_list(list2.head)
#
# list3 = LinkedList.new
# p list3.head = list3.merge(list1.head, list2.head)
# p list3.print_list(list3.head)


#new_list.print_list(new_list.head)