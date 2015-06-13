require_relative 'linked_list_item'

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
      item = first_item
      string = item.payload.to_s

      (@size -1).times do
        item = item.next_item
        string += ", #{item.payload}"
      end
      "| #{string} |"
    end
  end

  alias [] get

  def []=(index, new_payload)
    get_item(index).payload = new_payload
  end


  def delete(index)
    unless (0..size).include?(index)
      raise IndexError.new ("index #{index} doesn't exist")
    end

    if index.zero?
      @first_item = first_item.next_item
    else
      # get nodes before and after index and link them together
      # which effectively deletes the item at the given index
      get_item(index - 1).next_item=(get_item(index + 1))
    end
    @size -= 1
  end


  def index(input)
    if size == 0
      return nil
    else
      item = first_item
      index = 0
      until item.payload == input || index == (size - 1)
        item = item.next_item
        index += 1
      end
    end

    if item.payload == input
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

    i = 0
    until sorted?
      item = get_item(i)
      swap_with_next(i) unless item < item.next_item
      item = item.next_item
      if i < size - 2
        i += 1
      else
        i = 0
      end
    end
  end


  def swap_with_next(index)
    raise IndexError unless index < (size - 1)
    if index == 0
      a = first_item
      b = a.next_item
      c = b.next_item

      @first_item = b
      b.next_item = a
      a.next_item = c
    else
      a  = get_item(index - 1)
      b  = a.next_item
      c  = b.next_item
      d  = c.next_item

      b.next_item = d
      c.next_item = b
      a.next_item = c
    end
  end

end





