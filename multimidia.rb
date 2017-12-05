require_relative './algoritmos/lzw'
require_relative './algoritmos/runLength'
require_relative './algoritmos/shannonFano'

class Multimidia
  runLength = RunLength.new
  algoritmoLZW = LZW.new
  shannonFano = ShannonFano.new

  while true
    puts "\n\tDigite 1 para RunLength, 2 para LZW, 3 para Shannon-Fano ou qualquer outra coisa para sair:"
    case opcao = gets.to_i
    # run length
    when 1
      puts "\n\tDigite os símbolos que deseja codificar:"
      entrada = gets.chomp
      saida = runLength.comprimir(entrada)
      taxa = runLength.calcularTaxaCompressao(entrada, saida)

      puts "\nSaída: #{saida}"
      puts "Taxa de Compressão: #{taxa}"

    # LZW
    when 2
      puts "\n\tDigite 1 para codificar ou 2 para decodificar:"
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
      end

    # shannon-fano
    when 3
      puts "\n\tDigite os símbolos que deseja codificar:"
      entrada = gets.chomp
      saida = shannonFano.comprimir(entrada)

      puts "\nSaída: #{saida}"
    else
      break
    end
  end
end
