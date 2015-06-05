#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# Push method
def push_arguments(payloads, ll)
  payloads.each { |x| ll.push(x) unless x == "sort!"}
end

# And, populate it
if ARGV[0] == "sort!"
  push_arguments(payloads, ll)
  ll.sort!
else
  push_arguments(payloads, ll)
end

# Then, print it out

print "* -> "

ll.size.times do |i|
	print "#{ll.get(i).inspect} -> "
end

print "nil\n"