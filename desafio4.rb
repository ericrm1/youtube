puts "Quantos caracteres você deseja em sua senha?"
number_char = gets.chomp

o = [('a'..'z'), ('A'..'Z'), ('1'..'9')].map(&:to_a).flatten
string = (1..number_char.to_i).map { o[rand(o.length)] }.join

puts string