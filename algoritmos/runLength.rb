require_relative 'calculos'

class RunLength
  include Calculos
  # construtor vazio
  def initialize()
  end

  # método que irá comprimir
  def comprimir(entrada)
    saida = ""

    simboloAtual = entrada[0]
    saidaAux = ""
    contadorSimboloAtual = 0
    # algoritmo Run Length
    for i in 0..entrada.length
      if entrada[i] == simboloAtual
        saidaAux += entrada[i]
        contadorSimboloAtual += 1
      else
        if contadorSimboloAtual > 3
          saida += "!#{contadorSimboloAtual}#{simboloAtual}"
        else
          saida += saidaAux
        end
        simboloAtual = entrada[i]
        saidaAux = simboloAtual
        contadorSimboloAtual = 1
      end
    end

    return saida
  end
end
