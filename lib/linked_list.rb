require_relative 'linked_list_item'

class LinkedList
  attr_accessor :first_item,
                :size

  attr_reader   :last_item

  def initialize(*new_li)
    @size = 0
    new_li.each { |payload| push payload }
  end


  def push(item)
    new_item = LinkedListItem.new item

    if first_item
      @last_item.next_item = new_item
      @last_item           = new_item
    else
      @first_item = new_item
      @last_item  = new_item
    end
    @size += 1
  end


  def get(index)
    get_item(index).payload
  end


  alias_method :[], :get


  def last
    last_item.payload if @last_item
  end


  def to_s
    if size.zero?
      "| |"
    else
      linked_list = string_builder
      "| #{linked_list} |"
    end
  end


  def []=(index, new_payload)
    #reset item at "index" with "new_payload"
    get_item(index).payload = new_payload
  end


  def delete(index)
    raise IndexError, "index #{index} doesn't exist" unless (0..size).include?(index)

    if index.zero?
      @first_item = first_item.next_item
    else
      # gets items before and after "index" and links them together
      # which effectively deletes the item at the given "index"
      get_item(index - 1).next_item=(get_item(index + 1))
    end
    @size -= 1
  end


  def index(payload)
    if size == 0
      return nil
    else
     find_item payload
    end
  end


  def sorted?
    item = first_item
    if item && item.next_item
      check_sort? item
    else
      true
    end
  end


  def sort!
    i = 0
    until sorted?
      item = get_item(i)
      swap_with_next i unless pair_sorted? item
      if second_to_last_item?(i)
        i = 0
      else
        i += 1
      end
    end
  end


  def swap_with_next(index)
    raise IndexError unless index < last_item_index

    if index == 0
      a = first_item
      b = a.next_item
      c = b.next_item

      @first_item = b
      b.next_item = a
      a.next_item = c
    else
      a  = get_item index - 1
      b  = a.next_item
      c  = b.next_item
      d  = c.next_item

      b.next_item = d
      c.next_item = b
      a.next_item = c
    end
  end


  private

  def last_item_index
    size - 1
  end


  def second_to_last_item?(iterator)
    iterator == size - 2
  end


  def pair_sorted?(item)
    item < item.next_item
  end


  def check_sort?(item)
    (last_item_index).times do
      if item > item.next_item
        return false
      end
      item = item.next_item
    end
  end


  def get_item(index)
    raise IndexError, "Index #{index} is inavalid." unless (0..size).include?(index)

    if index.zero?
      first_item
    else
      item = first_item
      (index).times do
        item = item.next_item
      end
      item
    end
  end


  def find_item(payload)
    item = first_item; index = 0

    until item.payload == payload || index == last_item_index
      item = item.next_item
      index += 1
    end

    index if item.payload == payload
  end


  def string_builder
    item        = first_item
    linked_list = item.payload.to_s

    last_item_index.times do
      item = item.next_item
      linked_list += ", #{item.payload}"
    end
    linked_list
  end
end
