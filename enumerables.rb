# Implement some Enumerable methods
#
# Solution: Use iterative algorithms

def each(array, &block)
  for i in 0...array.size do
    yield array[i]
  end
end

puts "each(array, &block)"

each(["hello", "world"]) { |item| p item }

def map(array, &block)
  result = []

  each(array) do |item|
    result << block.call(item)
  end

  result
end

puts "\nmap(array, &block)"

p map(["hello", "world"]) { |item| item.upcase }
