module Calculos
  # calcular a taxa de compressao
  def calcularTaxaCompressao(entrada, saida)
    taxa = (0.0 + entrada.length) / saida.length
    return taxa
  end
end
