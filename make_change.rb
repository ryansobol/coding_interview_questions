# Minimal Number of Coins for Change
#
# Problem: Given a sorted set of currency, please implement a method which returns the minimal set
# of coins to make change for an amount of money in pennies. Duplicate coins are fine.
# 
# Example: The minimal number of coins to make change for 6 out of the set of coins  [1, 3, 4] is 
# [3, 3].

class Integer
  def make_change(*coins)
    bests = Array.new(self + 1, [])

    # for each integer up to self
    for i in 1..self do

      # for each coin
      coins.each do |coin|

        # for each previous best combo
        for j in 0...i do

          # duplicate the previous best combo and add the current coin to it
          combo = bests[j].dup << coin

          # keep going as long as the current combo's coins equal the current self
          if combo.reduce(:+) == i

            # if the current self's "best" combo is no coins (aka the default)
            if bests[i].empty?

              # then we have our first best combo
              bests[i] = combo

              # otherwise, if the current combo's size is smaller or equal the current best combo
            elsif combo.size <= bests[i].size

              # then we have a better combo
              bests[i] = combo
            end
          end
        end
      end
    end

    # return the best combo for the initial self
    bests[self]
  end
end

p 6.make_change(4, 3, 1)
p 15.make_change(9, 7, 1)
