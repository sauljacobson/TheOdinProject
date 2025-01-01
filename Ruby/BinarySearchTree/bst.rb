class Tree
  attr_accessor :root 

  def initialize(arr)
    @root = build_tree(arr)
  end 

  def build_tree(arr) 
    arr.uniq! 
    @root = arr[0] 

  
  end

  def insert() 

  end

  def delete()
  
  end 

  def find()

  end

  def level_order()

  end 

  def inorder() 

  end 

  def preorder()

  end

  def postorder()

  end

  def height()

  end

  def depth() 

  end

  def balanced?()

  end

  def rebalance() 

  end

end 

class Node
  attr_accessor :value, :left, :right 

  def initialize(value=nil, left=nil, right=nil)
    @value = value
    @left = left
    @right = right 
  end
end




