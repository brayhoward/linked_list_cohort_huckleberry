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
      @last_item = @first_item
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
      @first_item
    else
      i = 0
      current_node = @first_item
      until i == index
        current_node = current_node.next_item
        i += 1
      end
      current_node
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
    if @first_item.nil? or @first_item.next_item.nil?
      is_sorted = true
    else
      i = 0
      until i = (@size -1) do
        node      = get_item(i)
        next_node = get_item(i+1)
        if (node<=>(next_node)) == 1
          is_sorted = false
        else
          is_sorted = true
        end
      end
    end
    is_sorted
  end

  def sort!
    if @first_item.nil? or @first_item.next_item.nil?
      return
    end

    current_item = get_item(0)
    second_item  = get_item(1)
    if (current_item<=>(second_item)) == 1
      @first_item = second_item
      @first_item.next_item = current_item
    end

    while !self.sorted?
      if @size > 2
        current_item = get_item(1)
        second_item  = get_item(2)

        if (current_item<=>(next_item)) == 1

          @first_item.next_item  = second_item
          current_item.next_item = second_item.next_item
          second_item.next_item  = current_item
        end
      end
    end

  end

end





