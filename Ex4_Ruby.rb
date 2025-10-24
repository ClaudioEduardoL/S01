
module Rastreavel
  # Classes que incluírem este módulo devem possuir :nome e :localizacao_atual
  def obter_localizacao(hora)
    "#{nome} foi visto em #{localizacao_atual} às #{hora}"
  end
end

module Perigoso
  # Interface de risco — quem incluir deve sobrescrever
  def calcular_risco
    raise NotImplementedError, "Subclasse/módulo consumidor deve implementar #calcular_risco"
  end
end

# 2) Classe base
class Participante
  attr_reader :nome
  attr_accessor :localizacao_atual

  def initialize(nome, localizacao_atual = "Local desconhecido")
    @nome = nome
    @localizacao_atual = localizacao_atual
  end

  def to_s
    "#{nome} @ #{localizacao_atual}"
  end
end

# 3) Concretas
class Detetive < Participante
  include Rastreavel

  def investigar(alvo)
    "#{nome} está seguindo #{alvo}"
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  # grau_periculosidade: 0..10 (parâmetro simples para compor o risco)
  def initialize(nome, grau_periculosidade = 8, localizacao_atual = "Covil")
    super(nome, localizacao_atual)
    @grau_periculosidade = grau_periculosidade.to_i.clamp(0, 10)
  end

  # Exemplo de cálculo: risco base pelo grau + bônus se “sumido”
  def calcular_risco
    base = @grau_periculosidade
    bonus = localizacao_atual.downcase.include?("desconhecido") ? 2 : 0
    (base + bonus).clamp(0, 10)
  end
end

# 4) Cenário (agregação de participantes polimórficos)
class Cenario
  def initialize(participantes = [])
    @participantes = participantes
  end

  def adicionar(participante)
    @participantes << participante
  end

  # Lista apenas quem responde a obter_localizacao (i.e., Rastreavel)
  def rastreaveis
    @participantes.select { |p| p.respond_to?(:obter_localizacao) }
  end

  # 5) Filtra ameaças: responde a :calcular_risco e acima do limiar
  def identificar_ameacas(limiar: 7)
    @participantes.select do |p|
      p.respond_to?(:calcular_risco) && p.calcular_risco > limiar
    end
  end

  def imprimir_alvos_perigosos(limiar: 7)
    perigosos = identificar_ameacas(limiar: limiar)
    if perigosos.empty?
      puts "Nenhuma ameaça acima do limiar #{limiar}."
    else
      puts "Alvos perigosos (risco > #{limiar}):"
      perigosos.each do |p|
        risco = p.calcular_risco
        puts "- #{p.nome} (risco #{risco}) — localização: #{p.localizacao_atual}"
      end
    end
  end
end

# ======================
# Execução (main)
# ======================
if __FILE__ == $0
  # Coleta das localizações atuais via gets.chomp
  print "Localização atual de Sherlock: "
  loc_sherlock = STDIN.gets&.chomp.to_s

  print "Localização atual de Moriarty: "
  loc_moriarty = STDIN.gets&.chomp.to_s

  # Instâncias
  sherlock = Detetive.new("Sherlock Holmes", loc_sherlock)
  moriarty = MestreDoCrime.new("Professor Moriarty", 9, loc_moriarty)

  # Cenário com lista polimórfica
  cenario = Cenario.new([sherlock, moriarty])

  # Demonstração de rastreio
  print "Informe uma hora para rastrear (ex.: 22:15): "
  hora = STDIN.gets&.chomp.to_s

  puts "\n— Rastreio —"
  cenario.rastreaveis.each { |p| puts p.obter_localizacao(hora) }

  # Identificação de ameaças (select + respond_to?)
  puts "\n— Ameaças —"
  cenario.imprimir_alvos_perigosos(limiar: 7)
end
