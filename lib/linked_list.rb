class LinkedList
	attr_reader :first_item
	attr_reader :last
	attr_reader :size
	def push(arg)
		if @first_item.nil?
			@first_item = arg
		else
			@last = arg
		end

		if @size.nil?
			@size = 0
		else
			@size.next
		end
	end

	def get(arg)
		if arg.zero?
			@first_item
		elsif arg > 0
			@last
		end
	end
end
