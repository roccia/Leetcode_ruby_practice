#Construct Binary Tree from Preorder and Inorder Traversal
class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def to_ary
    temp = []
    temp += @left.to_a if @left
    temp << @value
    temp += @right.to_a if @right
    temp
  end
end

class ConstructBST

  def reconstruct(pre_order, in_order)
    build(pre_order, 0, pre_order.size - 1, in_order, 0, in_order.size - 1)
  end

  def build(pre_order, pre_start, pre_end, in_order, in_start, in_end)
    return nil if pre_start > pre_end
    root = pre_order[pre_start] #取前序遍历的第一个数字，就是当前的根结点
    index = in_start
    while index <= in_end && in_order[index] != root # 在中序遍历的数组中找根结点的位置
      index +=1
    end

    throw(RuntimeError, 'aaa') if index > in_end

    new_tree = TreeNode.new(root) #创建当前的根结点，并且为结点赋值

    # 递归构建当前根结点的左子树，左子树的元素个数：index-is+1个
    # 左子树对应的前序遍历的位置在[ps+1, ps+index-is]
    # 左子树对应的中序遍历的位置在[is, index-1]
    new_tree.left = build(pre_order, pre_start + 1, pre_start + index - in_start, in_order, in_start, index- 1)

    # 递归构建当前根结点的右子树，右子树的元素个数：ie-index个
    # 右子树对应的前序遍历的位置在[ps+index-is+1, pe]
    # 右子树对应的中序遍历的位置在[index+1, ie]
    new_tree.right = build(pre_order, pre_start + index - in_start +1, pre_end, in_order, index+1, in_end)
    new_tree.to_ary
  end
end

t = ConstructBST.new
pre_order= [3,9,20,15,7]
in_order = [9,3,15,20,7]
res = t.reconstruct(pre_order, in_order)
p res
