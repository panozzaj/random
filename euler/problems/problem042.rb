file = IO.read("../data/words.txt")
array = file.gsub(/"/, '').split(',')
string = array[0].each_char {|d| d - 39 }
puts array[0]
puts string.inspect
