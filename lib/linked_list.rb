require_relative 'linked_list_item'

class LinkedList
	attr_reader :first_item
	attr_reader :size



	def initialize(*new_li)
		@size = 0
		unless new_li.empty?
			new_li.each {|li| push(li)}
		end
	end

	def push(item)
		if @first_item.nil?
			@first_item = LinkedListItem.new(item)
			@last_item = @first_item
		else
			@last_item.next_item = LinkedListItem.new(item)
			@last_item = @last_item.next_item
		end
		@size += 1
	end

	def get(index)
		if (index > @size) or (index < 0)
			raise IndexError.new ("#{index} is a inavalid index!")
		end

		if index.zero?
			@first_item.payload
		else
			i = 0
			current_node = @first_item
			while i < index
				current_node = current_node.next_item
				i += 1
			end
			current_node.payload
		end
	end

	def last
		unless @last_item.nil?
				@last_item.payload
		end
	end

	def console_log
		print "* -> "

		@size.times do |i|
			print "#{get(i).inspect} ->"
		end

		print "nil"
	end



	def to_s
		if size.zero?
			"| |"
		else
			current_item = @first_item
			string = current_item.payload
			this_many = @size -1

			this_many.times do
				current_item = current_item.next_item
				string << ", #{current_item.payload}"
			end
			"| #{string} |"
		end
	end

end






















