# linkedlist.rb
# linked list implementation
# # usage ruby linkedlist.rb

# Alt. location node.rb
class Node

  protected
  attr_writer :pointer_next

  public
  attr_reader :data_value, :pointer_next

  def initialize(data_value=nil)
    @data_value = data_value
    ObjectSpace.define_finalizer(self, proc { :data_value.self_destruct! })
    ObjectSpace.define_finalizer(self, proc { :pointer_next.self_destruct! })
  end

end

# Alt. location dnode.rb
# require 'node'
class DNode < Node

  protected
  attr_writer :pointer_prior

  public
  attr_reader :pointer_prior

  def initialize(data_value=nil)
    @data_value = data_value
    ObjectSpace.define_finalizer(self, proc { :pointer_prior.self_destruct! })
  end

end

# Alt. location singlelinkedlist.rb
# require 'node'
class SingleLinkedList < Node
  attr_accessor :head, :tail

  def initialize(data_value=nil)
    if data_value
      @head = @tail = Node.new(data_value)
    else
      @head = @tail = nil
    end
  end
  # O(1)
  def add(data_value)
    new_node = Node.new(data_value)
    if @head.nil?
      @head = @tail = new_node
    else
      @tail.pointer_next = new_node
      @tail = new_node
    end
  end
  # O(n)
  def contains(data_value)
    current_node = @head
    while current_node.pointer_next != nil && current_node.data_value != data_value
      current_node = current_node.pointer_next
    end
    if current_node.data_value == data_value
      return current_node
    else
      return false
    end
  end
  # O(n)
  def remove(data_value)
    if @head.nil?
      return false
    end
    current_node = @head
    if current_node.data_value == data_value
      if @head == @tail
        @head = @tail = nil
      else
        @head = @head.pointer_next
      end
      return true
    end
    while current_node.pointer_next != nil && current_node.pointer_next.data_value != data_value
      current_node = current_node.pointer_next
    end
    if current_node.pointer_next != nil
      if current_node.pointer_next == @tail
        @tail = current_node
      end
      current_node.pointer_next = current_node.pointer_next.pointer_next
      return true
    end
    return false
  end

  def traverse
    a = []
    i = 0
    current_node = @head
    while current_node != nil
      puts a[i] = current_node.data_value
      current_node = current_node.pointer_next
      i += 1
    end
    return a
  end
  def reversetraverse
    a = []
    i = 0
    if @tail != nil
      current_node = @tail
      while current_node != @head
        previous_node = @head
        while previous_node.pointer_next != current_node
          previous_node = previous_node.pointer_next
        end
        puts a[i] = current_node.data_value
        i += 1
        current_node = previous_node
      end
      puts a[i] = current_node.data_value
    end
    return a
  end
end

# Alt. location doublelinkedlist.rb
# require 'dnode'
class DoubleLinkedList < DNode
  attr_accessor :head, :tail

  def initialize(data_value=nil)
    if data_value
      @head = @tail = DNode.new(data_value)
    else
      @head = @tail = nil
    end
  end
  # O(1)
  def add(data_value)
    new_node = DNode.new(data_value)
    if @head.nil?
      @head = @tail = new_node
    else
      new_node.pointer_prior = @tail
      @tail.pointer_next = new_node
      @tail = new_node
    end
  end
  # O(n)
  def contains(data_value)
    current_node = @head
    while current_node.pointer_next != nil && current_node.data_value != data_value
      current_node = current_node.pointer_next
    end
    if current_node.data_value == data_value
      return current_node
    else
      return false
    end
  end
  # O(n)
  def remove(data_value)
    if @head.nil?
      return false
    end
    if data_value == @head.data_value
      if @head == @tail
        @head = @tail = nil
      else
        @head = @head.pointer_next
        @head.pointer_prior = nil
      end
      return true
    end
    current_node = @head.pointer_next
    while current_node != nil && data_value != current_node.data_value
      current_node = current_node.pointer_next
    end
    if current_node == @tail
      @tail = @tail.pointer_prior
      @tail.pointer_next = nil
      return true
    elsif current_node != nil
      current_node.pointer_prior.pointer_next = current_node.pointer_next
      current_node.pointer_next.pointer_prior = current_node.pointer_prior
      return true
    end
    return false
  end

  def traverse
    a = []
    i = 0
    current_node = @head
    while current_node != nil
      puts a[i] = current_node.data_value
      current_node = current_node.pointer_next
      i += 1
    end
    return a
  end
  def reversetraverse
    a = []
    i = 0
    current_node = @tail
    while current_node != nil
      puts a[i] = current_node.data_value
      current_node = current_node.pointer_prior
      i += 1
    end
    return a
  end
end

# Alt. location rspec/rspec_linkedlist.rb
require 'rspec'

# TDD/BDD with rspec mock test
# ref.: https://relishapp.com/rspec/rspec-core/v/3-7/docs/mock-framework-integration/mock-with-rspec#doubles-may-be-used-in-generated-descriptions
# usage rspec linkedlist.rb
RSpec.describe Node do
  context "A Node holds a data value and has a pointer to the next node" do
   it "check data value !nil constructor" do
     test_node = Node.new('data value')
     expect(test_node.data_value).to eq('data value')
   end
   it "check data value nil constructor" do
     test_node = Node.new
     expect(test_node.data_value).to eq(nil)
   end
   it "check pointer to the next node" do
     test_node = Node.new
     expect(test_node.pointer_next).to eq(nil)
   end
  end
end

RSpec.describe DNode do
  context "A Node holds a data value and has a pointer to the next and prior node" do
   it "check data value !nil constructor" do
     test_node = DNode.new('data value')
     expect(test_node.data_value).to eq('data value')
   end
   it "check data value nil constructor" do
     test_node = DNode.new
     expect(test_node.data_value).to eq(nil)
   end
   it "check pointer to the next node" do
     test_node = DNode.new
     expect(test_node.pointer_next).to eq(nil)
   end
   it "check pointer to prior node" do
     test_node = DNode.new
     expect(test_node.pointer_prior).to eq(nil)
   end
  end
end

RSpec.describe SingleLinkedList do
  context "Each node consists of a data value and a pointer to the next node" do
   it "check SingleLinkedList nil constructor" do
     test_list = SingleLinkedList.new
     expect(test_list.head).to eq(nil)
     expect(test_list.tail).to eq(nil)
     expect(test_list.head).to eq(test_list.tail)
   end
   it "add node to empty SingleLinkedList" do
     test_list = SingleLinkedList.new
     test_list.add('data value')
     expect(test_list.head.data_value).to eq('data value')
     expect(test_list.head.pointer_next).to eq(nil)
     expect(test_list.head).to eq(test_list.tail)
   end
   it "add node to SingleLinkedList not empty" do
     test_list = SingleLinkedList.new('targo')
     test_list.add('tusca')
     test_list.add('34565')
     expect(test_list.tail.data_value).to eq('34565')
     expect(test_list.head.data_value).to eq('targo')
     expect(test_list.head.pointer_next.data_value).to eq('tusca')
   end
   it "add node to SingleLinkedList not empty" do
     test_list = SingleLinkedList.new('12')
     test_list.add('31')
     test_list.add('65')
     expect(test_list.tail.data_value).to eq('65')
     expect(test_list.head.data_value).to eq('12')
     expect(test_list.head.pointer_next.data_value).to eq('31')
   end
   it "SingleLinkedList contains node with datavalue x" do
     test_list = SingleLinkedList.new('F')
     test_list.add('x')
     test_list.add('6534')
     expect(test_list.contains('x').data_value).to eq('x')
     expect(test_list.contains('6534').data_value).to eq('6534')
     expect(test_list.contains('D')).to eq(false)
   end
   it "remove node with data value eq i in a SingleLinkedList not empty" do
     test_list = SingleLinkedList.new('YTOI001')
     test_list.add('i')
     test_list.add('6534')
     expect(test_list.remove('D')).to eq(false)
     expect(test_list.remove('6534')).to eq(true)
   end
   it "travers and reverse traverse a SingleLinkedList not empty" do
     test_list = SingleLinkedList.new('a')
     test_list.add('b')
     test_list.add('c')
     test_list.add('d')
     test_list.add('e')
     expect(test_list.traverse).to eq(['a','b','c','d','e'])
     expect(test_list.reversetraverse).to eq(['e','d','c','b','a'])
   end
  end
end

RSpec.describe DoubleLinkedList do
  context "Each node consists of a data value a pointer to the next node and a pointer to the prior node" do
    it "check DoubleLinkedList nil constructor" do
      test_list = DoubleLinkedList.new
      expect(test_list.head).to eq(nil)
      expect(test_list.tail).to eq(nil)
      expect(test_list.head).to eq(test_list.tail)
    end
    it "add node to empty DoubleLinkedList" do
      test_list = DoubleLinkedList.new
      test_list.add('data value')
      expect(test_list.head.data_value).to eq('data value')
      expect(test_list.head.pointer_next).to eq(nil)
      expect(test_list.head).to eq(test_list.tail)
    end
    it "add node to DoubleLinkedList not empty" do
      test_list = DoubleLinkedList.new('targo')
      test_list.add('tusca')
      test_list.add('34565')
      expect(test_list.tail.data_value).to eq('34565')
      expect(test_list.head.data_value).to eq('targo')
      expect(test_list.head.pointer_next.data_value).to eq('tusca')
    end
    it "DoubleLinkedList contains node with datavalue x" do
      test_list = DoubleLinkedList.new('F')
      test_list.add('x')
      test_list.add('6534')
      expect(test_list.contains('x').data_value).to eq('x')
      expect(test_list.contains('6534').data_value).to eq('6534')
      expect(test_list.contains('D')).to eq(false)
    end
    it "remove node with data value eq i in a DoubleLinkedList not empty" do
      test_list = DoubleLinkedList.new('YTOI001')
      test_list.add('i')
      test_list.add('6534')
      expect(test_list.remove('D')).to eq(false)
      expect(test_list.remove('6534')).to eq(true)
    end
    it "travers and reverse traverse a DoubleLinkedList not empty" do
      test_list = DoubleLinkedList.new('a')
      test_list.add('b')
      test_list.add('c')
      test_list.add('d')
      test_list.add('e')
      expect(test_list.traverse).to eq(['a','b','c','d','e'])
      expect(test_list.reversetraverse).to eq(['e','d','c','b','a'])
    end
  end
end
