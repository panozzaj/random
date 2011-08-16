class ChangePermutations

  def initialize(denominations, target)
    @denominations = denominations
    @target = target
  end

  def make_change
    decompose(@denominations, @target)
  end

  private

  def decompose(denominations_left, change_left)
    return [change_left] if denominations_left == [1]

    total = []
    current_denomination = denominations_left[0]
    highest = change_left / current_denomination

    0.upto(highest) do |value|
      extensions = decompose(denominations_left[1..-1], change_left - value * current_denomination)
      extensions.each do |extension|
        total << [value, extension].flatten
      end
    end

    total
  end
end

denominations = [200, 100, 50, 20, 10, 5, 2, 1]
target = 200

cp = ChangePermutations.new(denominations, target)
combinations = cp.make_change
puts combinations.size
