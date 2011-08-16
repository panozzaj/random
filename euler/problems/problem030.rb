number_hash = {}

(0..9).each do |digit|
  number_hash[digit.to_s] = digit ** 5
end

total = 0
(2..1000000).each do |number|
  sum = 0
  number.to_s.split(//).map {|digit| sum = sum + number_hash[digit]}
  if sum == number
    total = total + number
  end
end

puts total
