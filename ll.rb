#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
payloads.each { |x| ll.push(x) }


# Then, print it out

ll_size = ll.size
#puts "link list size is #{ll_size}"

index = 0
list_items = []

while index < ll.size do
	item = ll.get(index)
	list_items << item.to_s.inspect
	index += 1
end

if ll.size.zero?
	print "* -> nil"
else
	print "* -> #{list_items.join(" -> ")} -> nil"
end


