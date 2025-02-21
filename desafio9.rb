x = gets.chomp

def contador_palavras(frase)
  (frase.count " ") + 1
end 

puts " A frase contém #{ contador_palavras(x) } palavras"