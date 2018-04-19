class TreeNode
  attr_accessor :value,:left,:right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end


class BST < TreeNode
  attr_accessor :root

  def initialize(root=nil)
    @root = TreeNode.new(root)
  end

  def insert(node, value)
    if node.value == value
      node
    elsif value < node.value
      insert(node.left, value)
    elsif value > node.value
      insert(node.right, value)
    else
      node = TreeNode.new(value)
      node
    end
  end

  def search_at_node(value, node)
    return nil if node.nil?
    if value == node.value
      node
    elsif value > node.value
      search_at_node(value, node.right)
    elsif value < node.value
      search_at_node(value, node.left)
    end

  end

  def search(value)
    return nil if @root.nil?
    search_at_node(@root, value)
  end

  def delete(value)
    node = search(value)
    if !node.nil?
      remove(node)
    end
  end

  def remove(node)
    if node.left.nil? && node.right.nil?  #there are no children, simply delete node
      node = nil
    elsif !node.left.nil? && node.right.nil? #there is no right child, then replace the deleted node with the left child
      node = node.left
    elsif node.left.nil? && !node.right.nil? #there is no left child, then replace the deleted node with the right child
      node = node.right
    else  #there is both a left and right child
      node = delete_node_with_two_children(node)
    end
    node
  end

  def delete_node_with_two_children(node)
    min_node = find_min_node(node.right) #find the minimum value of right subtree (the left most child of right child)
    replace_value(min_node,node) #replace the value of the node to be removed with the found minimum
    remove_min_node(min_node) #remove the minimum value node
  end

  def find_min_node(node)
    if node.left.nil?
      min_node = node

    else
      find_min_node(node.left)
    end
  end

  def replace_value(min_node,node)
    node.value = min_node.value
  end

  def remove_min_node(min_node)
    min_node == nil
  end


  def in_order(node)
    return [] if node.nil?
    res = []
    res.concat in_order(node.left)
    res << node.value
    res.concat in_order(node.right)
    res
  end

  def pre_order(node)
      return [] if node.nil?
      res = []
      res << node.value
      res.concat pre_order(node.left)
      res.concat pre_order(node.right)
      res
  end

  def post_order(node=@root,&block)
    return [] if node.nil?
    res = []
    res.concat post_order(node.left)
    res.concat post_order(node.right)
    res << node.value
    res
  end
end

tree = TreeNode.new(3)
tree.left = TreeNode.new(9)
tree.right = TreeNode.new(20)
tree.right.left = TreeNode.new(15)
tree.right.right = TreeNode.new(7)
p tree

def max_depth(root)
   return 0 if root.nil?
    l = max_depth(root.left)
    r = max_depth(root.right)
    p "#{root.left},#{root.right}"
   p "#{l} ,#{ r }"
    [l,r].max + 1

end

p max_depth(tree)