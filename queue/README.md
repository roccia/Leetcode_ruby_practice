# Stack
stack = []

stack << 2 #push 2 => stack = [2]

stack << 3 # push 3 => stack = [2, 3]

stack.pop  # pop => 3, stack = [2]

# Queue
queue = Queue.new 

queue << 2 # push 2 => queue = [2]

queue << 3 # push 3 => queue = [2, 3] (just a representation, it will be an object though)

queue.pop # pop 2

# Hash incase of ruby
a = {} (or a = Hash.new)

a['one'] = 1 # a = {"one"=>1}

a['two'] = 2 # a = {"one"=>1, "two"=>2}

# Set
require 'set'

s = Set.new         # <Set: {}>

s.add(1)            # <Set: {1}>

s.add(2)            # <Set: {1, 2}>

s.add(1)            # <Set: {1, 2}>

s.instance_of?(Set) # true