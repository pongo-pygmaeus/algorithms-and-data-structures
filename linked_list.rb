class SinglyLinkedList

  attr_accessor :head

  def initialize(array, args={})
    input_array = array
    @head       = from_array(input_array)
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value      = value
      @next_node  = next_node
    end
  end

  def to_array
    output_array = []
    current_node = @head  

    until current_node == nil do
      output_array << current_node.value
      current_node = current_node.next_node
    end
    output_array
  end

  def insert_at_beginning(node_value)
    new_node = Node.new( node_value, @head )
    @head = new_node
  end

  def insert_at_end(node_value)
    new_node = Node.new( node_value, nil )
    last_element.next_node = new_node
  end
  
  def remove_duplicates
    current_node   = @head
    previous_node  = nil
    next_node      = nil 
    occurence_hash = {}

    until current_node == nil do
      next_node = current_node.next_node

      if occurence_hash[:"#{current_node.value}"]
        if previous_node 
          previous_node.next_node = next_node
        end
        current_node = next_node
      else
        occurence_hash[:"#{current_node.value}"] = true
        previous_node = current_node
        current_node  = next_node
      end
    end
    @head
  end

private 

  def last_element
    current_element = @head

    return nil if !current_element

    until !current_element.next_node
      current_element = current_element.next_node
    end
    current_element

  end

  def from_array(input_array)
    if input_array.length == 0
      return nil 
    end

    current_node = input_array.shift
    Node.new( current_node, from_array(input_array) )
  end
end
