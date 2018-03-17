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
      while (!@head.next?) && (@head.next.value != value)
        @head = @head.next
      end
      unless @head.next?
      end
    end
  end

  def sort(head)
    return head if (head.nil? || !head.next?)
    middle = get_middle(head) #get the middle of the list
    next_of_middle = middle.next #set the next of middle node to null
    middle.next = nil
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

  def get_middle(head)
    return head if head.nil?
    fast = head.next
    slow = head
    # Move fast by two and slow ptr by one
    #Finally slow  will point to middle node

    while !fast.nil?
      fast = fast.next
      if !fast.nil?
        slow = slow.next
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

  def reverse_list
      current_node = @head
      prev_node = nil
      until current_node.nil?
         next_node = current_node.next
        current_node.next = prev_node
        prev_node = current_node
        current_node = next_node
      end
      @head = prev_node
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
 list1.print_list(list1.head)
 list2.print_list(list2.head)

list3 = LinkedList.new
list3.head = list3.merge(list1.head, list2.head)
list3.print_list(list3.head)


#new_list.print_list(new_list.head)