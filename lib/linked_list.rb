class LinkedList
	attr_reader :first_item
	attr_reader :nextItem
	attr_reader :size
	def push(arg)
		if @first_item.nil?
			first = LinkedListItem.new(arg)
			@first_item = first
		else
			nextOne = LinkedListItem.new(arg)
			@nextItem = nextOne
		end

		if @size.nil?
			@size = 0
		else
			@size.next
		end
	end

	def get(arg)
		if arg.zero?
			@first_item.payload
		elsif arg > 0
			@nextItem.payload
		end
	end
end
