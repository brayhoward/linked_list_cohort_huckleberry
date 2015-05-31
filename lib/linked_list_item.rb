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

  def <=>(other)
    if self.payload.class == other.payload.class
      self.payload <=> other.payload
    else
      if self.payload.is_a? Symbol
        1
      elsif self.payload.is_a? Fixnum
        -1
      else
        -1 * (other <=> self)
      end
    end
  end

  def ===(lli)
     self.equal? lli
  end
end

