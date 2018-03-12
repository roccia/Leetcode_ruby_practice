require 'linked_list/node'
class LinkedList < Node
     def initialize(value)
       @head = Node.new(value)
     end

     def add(value)
        current = @head
        while current.next?
           current  = current.next
        end
         current.next = Node.new(value)
     end

     def delete(value)
        current.next = @head
        if current.value == value
           @head = current.next
        else
          while (!current.next?) && (current.next.value != value)
             current = current.next
          end
          unless current.next?
          end
        end
     end
end