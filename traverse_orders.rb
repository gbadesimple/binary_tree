# just doing my thing for learning and perfection

class BinaryTree
  attr_accessor :left, :right, :data

  def initialize(x = nil)
    @left = nil
    @right = nil
    @data = x
  end

  def insert(x)
    list = Array.new
    if @data == nil
      @data = x
    elsif @left == nil
      @left = BinaryTree.new(x)
    elsif @right == nil
      @right = BinaryTree.new(x)
    else
      list.push(@left)
      list.push(@right)

      loop do
        node = list.shift
        if node.left == nil
          node.insert(x)
          break
        else
          list.push(node.left)
        end

        if node.right == nil
          node.insert(x)
          break
        else
          list.push(node.right)
        end
      end
    end
  end

  def traverse
    list = Array.new
    yield @data
    list.push(@left) if @left != nil
    list.push(@right) if @right != nil
    loop do
      break if list.empty?
      node = list.shift
      yield node.data
      list.push(node.left) if node.left != nil
      list.push(node.right) if node.right != nil
    end
  end

  def insert(x)
    if @data == nil
      @data = x
    elsif x <= @data
      if @left == nil
        @left = BinaryTree.new(x)
      else
        @left.insert(x)
      end

    else
      if @right == nil
        @right = BinaryTree.new(x)
      else
        @right.insert(x)
      end
    end
  end

  def preorder
    yield @data
    @left.preorder { |y| yield y } if @left != nil
    @right.preorder { |y| yield y } if @right != nil
  end

  def inorder
    @left.inorder { |y| yield y } if @left != nil
    yield @data
    @right.inorder { |y| yield y } if @right != nil
  end

  def postorder
    @left.postorder { |y| yield y } if @left != nil
    @right.postorder { |y| yield y } if @right != nil
    yield @data
  end

end

alphabets = ["D", "C", "B", "A", "H", "G",
             "F", "E", "L", "K", "J", "I",
             "P", "O", "N", "M", "R", "Q",
             "Z", "Y", "X", "W", "V", "U",
             "T", "S"]

traversal = BinaryTree.new

alphabets.each { |x| traversal.insert(x) }

puts "\n Preorder traversal"
traversal.preorder { |x| print x, " " }

puts "\n"
puts "\n Inorder traversal"
traversal.inorder { |x| print x, " " }

puts "\n"
puts "\n Postorder traversal"
traversal.postorder { |x| print x, " " }
puts "\n"
