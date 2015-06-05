#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# And, populate it
payloads.each { |x| ll.push(x) }


# Then, print it out

print "* -> "

ll.size.times do |i|
	print "#{ll.get(i).inspect} -> "
end

print "nil"