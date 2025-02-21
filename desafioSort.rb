puts "Digite a lista de números separados por vírgula:" 
num = gets.chomp

list = num.split(",")

numero_temporario = 0
lista_temporaria = list
nova_lista = []

list.each do |numero|
    numero_temporario = numero

    lista_temporaria.each do |numero_comparacao|
        if numero_comparacao < numero_temporario
            numero_temporario = numero_comparacao
        end
    end
    
    nova_lista << numero_temporario
    lista_temporaria = lista_temporaria.reject{ |k| k == numero_temporario }
end

puts nova_lista