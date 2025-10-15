# Classe base Heroi
class Heroi:
    def __init__(self, nome: str):
        self.nome = nome

    # Método virtual (genérico)
    def usar_ultimate(self):
        print(f"{self.nome} usa sua habilidade suprema!")

# Classe Tanque (herda de Heroi)
class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} ativa sua ultimate: 'Martelo Terrestre!' (derruba todos ao redor)")

# Classe Dano (herda de Heroi)
class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} lança sua ultimate: 'Bomba de Pulso!' (explosão devastadora)")

# Função principal
if __name__ == "__main__":
    # Lista polimórfica de heróis
    herois = [
        Tanque("Reinhardt"),
        Dano("Tracer"),
        Dano("Soldado 76"),
        Tanque("Winston")
    ]

    # Percorre a lista e executa o método sobrescrito
    for heroi in herois:
        heroi.usar_ultimate()
