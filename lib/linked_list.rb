class LinkedList
	attr_reader :first_item
	attr_reader :next
	def push(arg)
		if @first_item.nil?
		 @first_item = arg
		else
			@next = arg
		end
	end

	def get(arg)
		if arg == 0
			@first_item
		elsif arg > 0
			@next
		end
	end
end
