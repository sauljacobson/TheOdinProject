class LinkedList 
  attr_accessor :list, :head, :tail, :size  

  def initialize() 
    @list = [] 
    @head = nil 
    @tail = nil 
    @size = 0 
  end

  def append(value)
    new_node = Node.new(value)
  
    if @size == 0
      @head = @tail = new_node
    else 
      @tail.next_node = new_node 
      @tail = new_node 
    end 
    @size += 1
  end

  def prepend(value) 
    new_node = Node.new(value)

    if @size == 0
      @head = @tail = new_node
    else 
      new_node.next_node = @head 
      @head = new_node 
    end 

    @size += 1
  end 


  def at(index) 
    counter = 0 
    node = @head 

    until counter == index 
      node = node.next_node 
      counter += 1 
    end 

    node.value 
  end 

  def pop() 
    tempNode = nil
    if (@tail == @head) 
      tempNode = @head
      @head = @tail = nil 
    else 
      node = @head
      
      while node.next_node != @tail 
        node = node.next_node 
      end 
  
      tempNode = node.next_node 
      node.next_node = nil 
      @tail = node 
    end 

    @size -= 1 
    tempNode.value
  end 

  def contains?(value) 
    node = @head 

    while node != nil
      if node.value == value 
        return true 
      end 
      node = node.next_node 
    end 

    nil 
  end 

  def find(value)
    node = @head 
    index = 0 

    while node.value != value 
      node = node.next_node 
      index += 1
    end 

    node.value == value ? index : nil 
  end 

  def to_s()
    node = @head 
    string = ""
    while node != nil 
      string << "( #{node.value} ) -> "
      node = node.next_node 
    end 
    string << "nil" 
    string 
  end
end 

class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil) 
    @value = value
    @next_node = next_node 
  end 
end

list = LinkedList.new 

list.append('dog') 
list.append('cat') 
list.append('parrot')
list.prepend('tiger')
list.append('hamster')
list.append('snake')
list.append('turtle') 

puts list.contains?('turtle')
puts list.find('hamster') 
puts list.at(3) 

puts list.pop() 
puts list.head.value
puts list.tail.value
puts list.size
puts list

