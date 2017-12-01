require_relative 'calculos'

class LZW
  include Calculos
  # construtor
  def initialize()
    configuracaoInicial()
  end

  # método que irá comprimir
  def comprimir(entrada)
    configuracaoInicial()
    saida = ""
    criaDicionario(entrada)
    preparacao("C", "Saída")

    # algoritmo LZW com prints apenas para melhorar visualização
    s = entrada[0]
    for i in 1...entrada.length
      c = entrada[i]
      if @dicionario.has_key?(s + c)
        print "\t#{s}\t\t#{c}\n"
        s = s + c
      else
        saida += @dicionario[s].to_s
        @dicionario[s + c] = @contagemSimbolo
        print "\t#{s}\t\t#{c}\t\t#{@dicionario[s]}\t\t#{s + c}\t\t#{@contagemSimbolo}\n"
        @contagemSimbolo += 1
        s = c
      end
    end
    puts "\t#{s}\t\tEOF\t\t#{@dicionario[s]}"
    saida += @dicionario[s].to_s

    return saida
  end

  # método que irá descomprimir
  def descomprimir(saida, simbolos)
    configuracaoInicial()
    retorno = ""
    entrada = ""
    criaDicionario(simbolos)
    preparacao("K", "Entrada")

    # algoritmo LZW com prints apenas para melhorar visualização
    s = nil
    for i in 0...saida.length
      k = saida[i]
      entrada = @dicionario.key(k.to_i)
      if i == 0
        print "\tNIL\t\t#{k}\t\t#{entrada}\n"
      end
      if entrada == nil
        entrada = s + s[0]
      end
      retorno += entrada.to_s
      if s != nil
        @dicionario[s + entrada[0]] = @contagemSimbolo
        print "\t#{s}\t\t#{k}\t\t#{entrada}\t\t#{s + entrada[0]}\t\t#{@contagemSimbolo}\n"
        @contagemSimbolo += 1
      end
      s = entrada
    end
    puts "\t#{s}\t\tEOF"

    return retorno
  end

  # método que imprime o cabeçalho da solução
  def preparacao(variavel, tipo)
    puts "\n\tS\t\t#{variavel}\t\t#{tipo}\t\tSímbolo\t\tCódigo"
    @dicionario.each do |chave, valor|
      puts "\t\t\t\t\t\t\t#{chave}\t\t#{valor}"
    end
  end

  # ordena e adiciona cada símbolo no dicionário com um número associado
  def criaDicionario(simbolos)
    @contagemSimbolo = 1
    simbolo = simbolos.chars.sort.join
    for i in 0...simbolo.length
      if (!@dicionario.has_key?(simbolo[i]))
        @dicionario[simbolo[i]] = @contagemSimbolo
        @contagemSimbolo += 1
      end
    end
  end

  # inicia configuração inicial do contador e do dicionário
  def configuracaoInicial()
    @contagemSimbolo = 1
    @dicionario = {}
  end
end
