require_relative 'calculos'

class ShannonFano
  include Calculos
  # construtor vazio
  def initialize()
  end

  # método que irá comprimir
  def comprimir(entrada)
    configuracaoInicial(entrada)

    puts "\nEntrada:"
    imprime(@probabilidades)

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

      # aqui é feita a divisão entre os conjuntos em relação aos pesos
      while prob < maxProb
        ultimaChave = dicionario.keys.last
        if maxProb >= dicionario[ultimaChave] + prob
          subconjuntoDireito[ultimaChave] = dicionario.delete(ultimaChave)
          prob += subconjuntoDireito[ultimaChave]
        else
          prob += dicionario[ultimaChave]
        end
      end

      # atribui o valor 0 à esquerda e o valor 1 à direita
      dicionario.each do |chave, valor|
        @codigos[chave] += "0"
      end
      subconjuntoDireito.each do |chave, valor|
        @codigos[chave] += "1"
      end

      # chama recursivamente para cada subconjunto
      divideConjunto(dicionario)
      divideConjunto(subconjuntoDireito)
    end
  end

  # inicia configuração inicial da probabilidade dos símbolos
  def configuracaoInicial(entrada, *retorno)
    @probabilidades = {}
    @codigos = {}

    # calcula frequência de cada símbolo
    for i in 0...entrada.length
      if (@probabilidades.has_key?(entrada[i]))
        @probabilidades[entrada[i]] += 1
      else
        @probabilidades[entrada[i]] = 1
      end
    end

    # calcula probabilidade em cima da frequência
    @probabilidades.each do |chave, valor|
      @probabilidades[chave] = (0.0 + valor) / entrada.length
      @codigos[chave] = ""
    end

    # ordena de forma decrescente
    @probabilidades = @probabilidades.sort_by(&:last).reverse.to_h
    if retorno
      return @probabilidades
    end
  end

  # método que imprime dicionário
  def imprime(dicionario)
    dicionario.each do |chave, valor|
      puts "   #{chave}\t#{valor}"
    end
  end
end
