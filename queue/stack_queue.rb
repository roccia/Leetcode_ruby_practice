#用两个栈实现一个队列。队列的声明如下，请实现它的两个函数appendTail 和deleteHead，分别完成在队列尾部插入结点和在队列头部删除结点的功能

class StackQueue
   attr_accessor :stack1,:stack2
   def initialize
      @stack1 = [] #插入栈，只用于插入的数据
      @stack2 = [] #弹出栈，只用于弹出数据
   end

   def append_tail(t)
       stack1 << t  #添加操作，成在队列尾部插入结点
   end

   def delete_head
     #先判断弹出栈是否为空，如果为空就将插入栈的所有数据弹出栈，
     #并且将弹出的数据压入弹出栈中
     if stack2.empty?
        while !stack1.empty?
           stack2 << stack1.pop
        end
     end
     stack2.pop #返回弹出栈的栈顶元素，对应的就是队首元素。
   end

end