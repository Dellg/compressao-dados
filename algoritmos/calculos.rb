module Calculos
  # calcular a taxa de compressao
  def calcularTaxaCompressao(entrada, saida)
    taxa = (0.0 + entrada.length) / saida.length
    return taxa
  end

  # calcular a probabilidade máxima de um subconjunto
  def calcularProbabilidade(dicionario)
    probabilidadeMaxima = 0.0
    dicionario.each do |chave, valor|
      probabilidadeMaxima += valor
    end
    return probabilidadeMaxima
  end

  # calcular entropia
  def calcularEntropia(dicionario)
    somatorio = 0.0
    dicionario.each do |chave, valor|
      somatorio += valor * Math.log2(valor)
    end
    somatorio *= -1
    return somatorio
  end

  # calcular comprimento médio
  def calcularComprimentoMedio(probabilidade, codigo)
    somatorio = 0.0
    probabilidade.each do |chave, valor|
      tamanhoCodigo = codigo[chave].length
      somatorio += valor * tamanhoCodigo
    end
    return somatorio
  end

  # calcular eficiência
  def calcularEficiencia(entropia, comprimento)
    eficiencia = entropia/comprimento
    return eficiencia
  end

  # calcular redundância
  def calcularRedundancia(eficiencia)
    redundancia = 1-eficiencia
    return redundancia
  end
end
