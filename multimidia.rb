require_relative './algoritmos/LZW'

class Multimidia

  algoritmoLZW = LZW.new

  while true
    puts "\n\tDigite 1 para codificar, 2 para decodificar ou qualquer outra coisa para sair:"
    opcao = gets.to_i
    if opcao == 1
      puts "\tDigite os símbolos que deseja codificar:"
      entrada = gets.chomp
      saida = algoritmoLZW.comprimir(entrada)
      taxa = algoritmoLZW.calcularTaxaCompressao(entrada, saida)

      puts "\nSaída: #{saida}"
      puts "Taxa de Compressão: #{taxa}"

    elsif opcao == 2
      puts "\tDigite o código que deseja decodificar (cada código deve ser separado por espaço):"
      while true
        saida = gets.split(" ")
        if saida.length <= 1
          puts "\tNão foi identificado nenhum espaço separando o código!\n\tDigite novamente separando cada código com um espaço."
        else
          break
        end
      end
      puts "\tAgora digite os símbolos que compõem o dicionário inicial:"
      simbolos = gets.chomp
      retorno = algoritmoLZW.descomprimir(saida, simbolos)

      puts "\nEntrada: #{retorno}"

    else
      break
    end
  end
end
