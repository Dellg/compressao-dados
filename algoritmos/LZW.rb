class LZW
  # construtor
  def initialize()
    @contagemSimbolo = 1
    @dicionario = {}
  end

  # método que irá comprimir
  def comprimir(entrada)
    saida = ""
    criaDicionario(entrada)

    # preparação
    puts "\n\tS\t\tC\t\tSaída\t\tCódigo\t\tSímbolo"
    @dicionario.each do |chave, valor|
      puts "\t\t\t\t\t\t\t#{valor}\t\t#{chave}"
    end

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
        print "\t#{s}\t\t#{c}\t\t#{@dicionario[s]}\t\t#{@contagemSimbolo}\t\t#{s + c}\n"
        @contagemSimbolo += 1
        s = c
      end
    end
    puts "\t#{s}\t\tEOF\t\t#{@dicionario[s]}"
    saida += @dicionario[s].to_s

    puts "\nSaída: #{saida}"
    puts "Taxa de Compressão: #{calcularTaxaCompressao(entrada, saida)}"
  end

  # método que irá descomprimir
  def descomprimir(saida, simbolos)
    retorno = ""
    entrada = ""
    criaDicionario(simbolos)

    # preparação
    puts "\n\tS\t\tK\t\tEntrada\t\tCódigo\t\tSímbolo"
    @dicionario.each do |chave, valor|
      puts "\t\t\t\t\t\t\t#{valor}\t\t#{chave}"
    end

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
        print "\t#{s}\t\t#{k}\t\t#{entrada}\t\t#{@contagemSimbolo}\t\t#{s + entrada[0]}\n"
        @contagemSimbolo += 1
      end
      s = entrada
    end
    puts "\t#{s}\t\tEOF"

    puts "\nEntrada: #{retorno}"
  end

  # calcular a taxa de compressao
  def calcularTaxaCompressao(entrada, saida)
    taxa = (0.0 + entrada.length) / saida.length
    return taxa
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
end
