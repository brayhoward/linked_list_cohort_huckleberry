require_relative 'linked_list_item'

class LinkedList
	attr_reader :first_item
	attr_reader :size


	def initialize(*new_li)
		@size = 0
		unless new_li.empty? ##### get rid of this unless
			new_li.each {|payload| push(payload)}
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


	def get_item(index)
		if (index > @size) or (index < 0)
			raise IndexError, ("#{index} is a inavalid index!")
		end

		if index.zero?
			@first_item
		else
			i = 0
			current_node = @first_item
			while i < index
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

			this_many = index +1
			this_number_of = index -1
			num2_item = @first_item
			num1_item = @first_item

			this_number_of.times do
				num1_item = num1_item.next_item
			end

			this_many.times do
				num2_item = num2_item.next_item
			end
			num1_item.next_item=(num2_item)
		end

		@size -= 1
	end


	def index(input)
		current_item = @first_item
		i = 0

		unless @size == 0
			payload = @first_item.payload
			until payload == input or i == @size -1 do
				current_item = current_item.next_item
				payload = current_item.payload
				i += 1
			end
		end

		unless input === payload
			nil
		else
			i
		end
	end

end





