def vogal_counter(word)
  vogals = ['a','e','i','o', 'u', 'A', 'E', 'I', 'O', 'U']
  word.count(vogals.join)
end

puts "Digite uma palavra:"
word = gets.chomp

puts vogal_counter(word)