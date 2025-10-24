class MicroondasUnidade
  def initialize(potencia_watts: 800)
    @potencia_watts = potencia_watts
  end

  # Simula aquecimento por N segundos
  def aquecer_por(segundos)
    s = Integer(segundos) rescue 0
    raise ArgumentError, "Segundos deve ser > 0" if s <= 0
    "Micro-ondas aquecendo por #{s}s (@#{@potencia_watts}W)... concluído."
  end
end

# 2) Mensagem agregada (Agregação)
class DMail
  attr_reader :conteudo, :hora_envio # "HH:MM"

  def initialize(conteudo, hora_envio)
    @conteudo   = conteudo.to_s
    @hora_envio = hora_envio.to_s
  end

  def to_s
    "[#{hora_envio}] #{conteudo}"
  end
end

# 3) Telefone que usa a unidade por composição e agrega D-Mails
class TelefoneDeMicroondas
  def initialize(unidade: MicroondasUnidade.new)
    @unidade = unidade       # composição
    @dmails  = []            # agregação
  end

  # 4) Coleta dados, aciona unidade e agrega novo DMail
  def enviar_dmail
    print "Conteúdo do D-Mail: "
    conteudo = STDIN.gets&.chomp.to_s

    print "Hora de envio (HH:MM): "
    hora = STDIN.gets&.chomp.to_s

    # Chamada à peça essencial
    puts @unidade.aquecer_por(5)

    dmail = DMail.new(conteudo, hora)
    @dmails << dmail
    dmail
  end

  # 5) Filtra D-Mails com hora_envio posterior ao corte
  def listar_dmails(horario_corte)
    corte_min = self.class.hora_para_minutos(horario_corte)
    @dmails.select { |d| self.class.hora_para_minutos(d.hora_envio) > corte_min }
  end

  # Exposição somente-leitura da lista (cópia)
  def dmails
    @dmails.dup
  end

  # Utilitário: "HH:MM" -> minutos
  def self.hora_para_minutos(hhmm)
    h, m = hhmm.split(":").map(&:to_i)
    (h * 60) + m
  end
end

# ======================
# Execução (main)
# ======================
if __FILE__ == $0
  telefone = TelefoneDeMicroondas.new

  puts "=== Envio de D-Mails ==="
  # Exemplos de envios (ajuste a quantidade conforme necessário)
  2.times { telefone.enviar_dmail }

  print "\nListar D-Mails após qual horário (HH:MM)? "
  corte = STDIN.gets&.chomp.to_s

  filtrados = telefone.listar_dmails(corte)

  puts "\nD-Mails após #{corte}:"
  if filtrados.empty?
    puts "(nenhum)"
  else
    puts filtrados.map(&:to_s)
  end
end
