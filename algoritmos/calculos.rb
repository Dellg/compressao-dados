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
end
