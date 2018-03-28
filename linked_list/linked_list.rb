class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def next?
    !@next.nil?
  end
end

class LinkedList < Node
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def add(value)
    current = Node.new(value)
    if !@head
      @head = current
      @tail = current
    else
      @tail.next = current
      @tail = current
    end
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
    merge(left, right)
  end

  def merge(left, right)
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


  def print_list(head)
    result = []
    current = head
    while !current.nil?
      result << current.value
      current = current.next
    end
    result
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
    @head = prev_node
  end

  def reverse_list_recursive(node=@head, prev=nil)
    if !node
      return @head = prev
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

end

list1 = LinkedList.new
list1.add(15)
list1.add(10)
list1.add(5)
list1.add(20)
list1.add(3)
list1.add(2)
head1 = list1.head
p list1.print_list(list1.head)

p list1.reverse_list
list2 = LinkedList.new
list2.add(1)
list2.add(6)
list2.add(11)
list2.add(16)
list2.add(21)
list2.add(26)
head2 = list2.head

#list1.print_list(head1)
#list2.print_list(head2)
list1.head = list1.sort(head1)
list2.head = list2.sort(head2)
p list1.print_list(list1.head)
p list2.print_list(list2.head)

list3 = LinkedList.new
p list3.head = list3.merge(list1.head, list2.head)
p list3.print_list(list3.head)


#new_list.print_list(new_list.head)