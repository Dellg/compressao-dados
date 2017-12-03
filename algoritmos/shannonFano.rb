require_relative 'calculos'

class ShannonFano
  include Calculos
  # construtor vazio
  def initialize()
  end

  # método que irá comprimir
  def comprimir(entrada)
    configuracaoInicial(entrada)
  end

  # inicia configuração inicial da probabilidade dos símbolos
  def configuracaoInicial(entrada)
    @probabilidades = {}
    for i in 0...entrada.length
      if (@probabilidades.has_key?(entrada[i]))
        @probabilidades[entrada[i]] += 1
      else
        @probabilidades[entrada[i]] = 1
      end
    end
    @probabilidades.each do |chave, valor|
      @probabilidades[chave] = (0.0 + valor) / entrada.length
    end
    @probabilidades = @probabilidades.sort_by(&:last).reverse.to_h
    puts @probabilidades
  end
end
