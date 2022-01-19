
# !GOAL Create a method to make the random number generator from 1 to 20 with a normal dist

# [1..20] => [1, 2, 2, 3, 3, 3, 4, 4, 4, 4 .... 10,... 19, 19, 20 ].sample

def create_weighted_array(range)
  # range = Array(1..20)
  # Find the median
  median = range.length / 2
  # first half, 1: 1, 2: 2's
  output = []
  range.each do |x|
    if x <= median
      x.times do 
        output << x
      end
    else
      # binding.pry
      (range.last - x + 1).times do 
        output << x
      end
    end
  end
  output
end

def is_positive
  rand(0..1) == 0
end

def equip_stats
  rand(1..10)
end

# TESTING
# p create_weighted_array(Array(1..20))