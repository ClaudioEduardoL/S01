# Classe que representa a arma de combate (Composição)
class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"Arma: {self.nome} | Dano: {self.dano}"

# Classe que representa um ladrão fantasma (Agregação)
class LadraoFantasma:
    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def __str__(self):
        return f"{self.nome} ({self.arcano})"

# Classe principal: Joker
class Joker:
    def __init__(self, arma: ArmaCorpoACorpo, equipe: list):
        # Composição → Joker contém uma arma como parte intrínseca
        self.arma = arma
        # Agregação → Joker agrega uma lista de membros (que existem separadamente)
        self.equipe = equipe

    def mostrar_informacoes(self):
        print("=== Joker ===")
        print(self.arma)
        print("\nEquipe Phantom Thieves:")
        for membro in self.equipe:
            print(f"- {membro}")

# Função principal
if __name__ == "__main__":
    # Criação da lista de Ladrões Fantasmas (Agregação)
    equipe_phantom = [
        LadraoFantasma("Ryuji", "Chariot"),
        LadraoFantasma("Ann", "Lovers"),
        LadraoFantasma("Morgana", "Magician"),
        LadraoFantasma("Yusuke", "Emperor")
    ]

    # Criação da Arma (Composição)
    faca_joker = ArmaCorpoACorpo("Faca de Prata", 85)

    # Criação da instância principal
    joker = Joker(arma=faca_joker, equipe=equipe_phantom)

    # Demonstração dos relacionamentos
    joker.mostrar_informacoes()
