require_relative 'linked_list_item'
require 'pry'
class LinkedList
  attr_reader :first_item
  attr_reader :size


  def initialize(*new_li)
    @size = 0
    new_li.each {|payload| push(payload)}
  end


  def push(item)
    new_item = LinkedListItem.new(item)

    if @first_item.nil?

      @first_item = new_item
      @last_item = first_item
    else
      @last_item.next_item = new_item
      @last_item = @last_item.next_item
    end
    @size += 1

  end


  def get_item(index)

    unless (0..@size).include?(index)
      raise IndexError, ("Index #{index} is inavalid.")
    end

    if index.zero?
      first_item
    else
      node = @first_item
      (index).times do
        node = node.next_item
      end
      node
    end
  end

  def get(index)
    get_item(index).payload
  end


  def last
    unless @last_item.nil?
      @last_item.payload
    end
  end


  def to_s
    if size.zero?
      "| |"
    else
      current_item = @first_item
      string = current_item.payload

      (@size -1).times do
        current_item = current_item.next_item
        string << ", #{current_item.payload}"
      end
      "| #{string} |"
    end
  end

  alias [] get

  def []=(index, payload)
    list_item = get_item(index)
    list_item.payload = payload
  end


  def delete(index)
    unless (0..@size).include?(index)
      raise IndexError.new ("index #{index} dosnt exist")
    end

    if index.zero?
      @first_item = first_item.next_item
    else
      # get nodes before and after index and link them together
      # which effectively deletes the item at the given index
      get_item(index -1).next_item=(get_item(index +1))
    end

    @size -= 1
  end


  def index(input)
    current_item = @first_item
    index = 0

    unless @size == 0
      payload = @first_item.payload
      until payload == input or index == @size -1 do
        current_item = current_item.next_item
        payload = current_item.payload
        index += 1
      end
    end

    unless input === payload
      nil
    else
      index
    end
  end

  def sorted?
    node = first_item
    if node.nil? || node.next_item.nil?
      return true
    end
    (size - 1).times do
      if node > node.next_item
        return false
      end
      node = node.next_item
    end
  end

  def sort!
    if @first_item.nil? or @first_item.next_item.nil?
      return true
    end

    current_item = get_item(0)
    second_item  = get_item(1)
    if current_item > second_item
      @first_item = second_item
      @first_item.next_item = current_item
    end

    i = 0
    node = first_item.next_item
    unless self.sorted?
      if node > node.next_item

        get_item(0).next_item = node.next_item

        node.next_item.next_item = node
        node.next_item = node.next_item.next_item

      else
        node = node.next_item
      end
      i += 1
    end

  end

end





