require './algoritmos/LZW'

class Multimidia

  algoritmoLZW = LZW.new

  while true
    puts "\n\tDigite 1 para codificar, 2 para decodificar ou qualquer outra coisa para sair:"
    opcao = gets.to_i
    if opcao == 1
      puts "\tDigite os símbolos que deseja codificar:"
      entrada = gets.chomp
      algoritmoLZW.comprimir(entrada)

    elsif opcao == 2
      puts "\tDigite o código que deseja decodificar (cada código deve ser separado por espaço):"
      saida = gets.split(" ")
      puts "\tAgora digite os símbolos que compõem o dicionário inicial:"
      simbolos = gets.chomp
      algoritmoLZW.descomprimir(saida, simbolos)

    else
      break
    end
  end
end
