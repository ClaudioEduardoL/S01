
# 1) Classe base (abstração por contrato)
class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  # Deve ser sobrescrito nas filhas
  def tocar_partitura(peca)
    raise NotImplementedError, "Subclasse deve implementar #tocar_partitura"
  end

  def to_s
    "#{nome} (#{instrumento})"
  end
end

# 2) Classes filhas
class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    "#{nome} executa #{peca} ao piano com dinâmica precisa."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    "#{nome} interpreta #{peca} ao violino com vibrato expressivo."
  end
end

# 3) Classe Maestro
class Maestro
  def initialize(musicos = [])
    @musicos = musicos
  end

  # 4) each para acionar o método polimórfico
  def iniciar_ensaio(peca)
    puts "=== Ensaio iniciado: #{peca} ==="
    @musicos.each do |m|
      puts m.tocar_partitura(peca)
    end
    puts "=== Ensaio encerrado ==="
    nil
  end

  # 5) map para retornar um NOVO Array de mensagens
  def mudar_foco(estado)
    @musicos.map { |m| "#{m.nome} agora está #{estado.capitalize}!" }
  end
end

# 6) Main: cria músicos, pergunta a peça e roda o ensaio
if __FILE__ == $0
  # Exemplo de formação (adicione/edite conforme desejar)
  musicos = [
    Pianista.new("Kousei"),
    Violinista.new("Kaori")
  ]

  print "Nome da peça a ser tocada no ensaio: "
  peca = STDIN.gets&.chomp.to_s

  maestro = Maestro.new(musicos)

  # Mensagens de foco (demonstra o uso de .map)
  mensagens_foco = maestro.mudar_foco("concentrado")
  puts mensagens_foco

  # Inicia o ensaio (usa .each e polimorfismo)
  maestro.iniciar_ensaio(peca)
end
