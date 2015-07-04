class LinkedListItem
  include Comparable
  attr_accessor :payload
  attr_reader :next_item


  def initialize(data)
    @payload = data
  end

  def next_item=(lli)
    raise ArgumentError, "can't next_item to self" if self === lli
    @next_item = lli
  end

  def last?
    next_item.nil?
  end

  def <=>(other_node)
    return is_same(other_node) if is_same(other_node)

    if self.payload.is_a? Symbol
      1
    elsif self.payload.is_a? Fixnum
      -1
    else
      -1 * (other_node <=> self)
    end
  end

  def is_same(other_node)
    self.payload <=> other_node.payload if self.payload.class == other_node.payload.class
  end


  def ===(lli)
     self.equal? lli
  end
end

