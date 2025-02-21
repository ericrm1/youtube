puts "Digite o número:"
value = gets.chomp.to_i

if value > 1 && (value % 1) == 0 && (value % value) == 0 && (value == 2 || (value % 2) != 0) && (value == 3 || value % 3 != 0)
  puts "Número Primo"
else 
  puts "Não é primo"
end