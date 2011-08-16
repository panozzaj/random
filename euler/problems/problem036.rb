sum = 0
1.upto(1_000_000) do |n|
  if n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse
    sum += n
  end
end
puts sum

