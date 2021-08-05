
# basic output
puts "-----------------Output----------------"
puts "Hello World"

# basic input
puts "\n-----------------Input----------------"
puts "Input a number"
input = gets

puts "This was your number: " + input


# basic loop
puts "\n-----------------Iteration----------------"
puts "regular for, like python"
for i in 1..5 do
  puts i
end

puts "alternate loop, for each"
# same as
(1..5).each { |i|
  puts i
}

choice = 1
puts "\n-----------------Iteration - Until Loop----------------"
until choice == 0 do
  puts "please input - (0 to quit)"
  choice = gets.to_i
end

# branching
puts "\n-----------------Branching----------------"
puts "please enter a number"
input = gets.to_i

if input < 0
  puts "input was negative"
elsif input == 0
  puts "input was 0"
else
  puts "input was positive"
end

=begin
This is embedded documentation.
=end

