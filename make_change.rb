# Find the Minimum Coins for Change
#
# Solution: An iterative, dynamic programming algorithm 
#
# See: http://en.wikipedia.org/wiki/Dynamic_programming

class Integer
  def make_change(*coins)
    # create an array for memoizing the best coins for every value from 0 to self
    best_coins = Array.new(self + 1, [])

    # for each positive integer up to self
    for value in 1..self do

      # for each coin
      coins.each do |coin|

        # for each previous best coins (not including the current value)
        for j in 0...value do

          # create a duplicate of the previous best coins for the current value
          previous_best_coins = best_coins[j].dup

          # add the current coin to the previous best coins (this is now the test coins)
          test_coins = previous_best_coins << coin

          # continue as long as the test coins' value is equal the current value
          if test_coins.reduce(:+) == value

            # if the current value's "best" coins are no coins (aka the default)
            if best_coins[value].empty?

              # then we have found the initial best coins for the current value
              best_coins[value] = test_coins

              # but, if the test coins' size is smaller than the current value's best coins' size
            elsif test_coins.size < best_coins[value].size

              # then we have found even better best coins for the current value
              best_coins[value] = test_coins
            end
          end
        end
      end
    end

    # return the best coins for self
    best_coins[self]
  end
end

p 6.make_change(4, 3, 1)
p 15.make_change(9, 7, 1)
