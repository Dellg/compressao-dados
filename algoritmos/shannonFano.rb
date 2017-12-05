require_relative 'calculos'

class ShannonFano
  include Calculos
  # construtor vazio
  def initialize()
  end

  # método que irá comprimir
  def comprimir(entrada)
    configuracaoInicial(entrada)

    divideConjunto(@probabilidades)
    return @codigos
  end

  # divide o conjunto em 2 subconjuntos
  def divideConjunto(dicionario)
    if dicionario.length > 1
      # cria subconjunto direito, o esquerdo será o restante do dicionário de entrada
      subconjuntoDireito = {}

      prob = 0.0
      maxProb = calcularProbabilidade(dicionario) / 2

      while prob < maxProb
        ultimaChave = dicionario.keys.last
        if maxProb >= dicionario[ultimaChave] + prob
          subconjuntoDireito[ultimaChave] = dicionario.delete(ultimaChave)
          prob += subconjuntoDireito[ultimaChave]
        else
          prob += dicionario[ultimaChave]
        end
      end

      dicionario.each do |chave, valor|
        @codigos[chave] += "0"
      end
      subconjuntoDireito.each do |chave, valor|
        @codigos[chave] += "1"
      end

      divideConjunto(dicionario)
      divideConjunto(subconjuntoDireito)
    end
  end

  # inicia configuração inicial da probabilidade dos símbolos
  def configuracaoInicial(entrada)
    @probabilidades = {}
    @codigos = {}
    for i in 0...entrada.length
      if (@probabilidades.has_key?(entrada[i]))
        @probabilidades[entrada[i]] += 1
      else
        @probabilidades[entrada[i]] = 1
      end
    end
    @probabilidades.each do |chave, valor|
      @probabilidades[chave] = (0.0 + valor) / entrada.length
      @codigos[chave] = ""
    end
    @probabilidades = @probabilidades.sort_by(&:last).reverse.to_h

    puts "\nEntrada:"
    imprime(@probabilidades)
  end

  # método que imprime dicionário
  def imprime(dicionario)
    dicionario.each do |chave, valor|
      puts "   #{chave}\t#{valor}"
    end
  end
end
