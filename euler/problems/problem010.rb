
primes = [2]
3.upto(2_000_000) do |value|
  if value % 1000 == 0
    puts value
  end
  prime = true
  max_prime = Math.sqrt(value)
  primes.each do |prime|
    if value % prime == 0
      prime = false
      break
    end
    if prime >= max_prime
      break
    end 
  end

  if prime
    primes << value
  end
end

total = primes.inject(0) { |sum, p| sum = sum + p }
puts 'total: ' + total.inspect
