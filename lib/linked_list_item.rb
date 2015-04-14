class LinkedListItem

	include Comparable
	attr_reader :payload
	attr_reader :next_item

	def initialize(data)
		@payload = data
	end

	def next_item=(lli)
		raise ArgumentError if self == lli
		@next_item = lli
	end

	def last?
		next_item.nil?
	end
end

