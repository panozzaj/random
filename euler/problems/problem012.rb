class Problem12
  def initialize
    number = 0
    increment = 1
    while true
      number, increment = triangle(number, increment)
      n = number_of_factors(number)
      puts "number_of_factors(#{number}): " + n.to_s
      break if n > 500
    end
  end

  def number_of_factors(number)
    true_sqrt = Math.sqrt(number)
    sqrt = true_sqrt.floor
    total = 0
    1.upto(sqrt) do |i|
      if number % i == 0
        total = total + 2
      end
    end

    if number % true_sqrt == 0
      total - 1
    else
      total
    end
  end

  def triangle(triangle, increment)
    [triangle + increment, increment + 1]
  end
end

answer = Problem12.new
