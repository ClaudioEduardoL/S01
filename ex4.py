from abc import ABC, abstractmethod
from typing import List  # Import necessário para tipagem genérica compatível

# ============================
# Interfaces
# ============================

class IHackeavel(ABC):
    @abstractmethod
    def hackear(self):
        pass


class IPersonalizavel(ABC):
    @abstractmethod
    def upgrade(self, custo: int):
        pass


# ============================
# Classes concretas
# ============================

class NetRunner(IHackeavel, IPersonalizavel):
    def __init__(self, nome: str):
        self.nome = nome
        self.nivel = 1

    def hackear(self):
        print(f"{self.nome} invade o sistema inimigo com maestria digital!")

    def upgrade(self, custo: int):
        self.nivel += 1
        print(f"{self.nome} aprimorou seu cyberdeck por {custo} créditos. (Nível atual: {self.nivel})")


class CarroDeRua(IHackeavel, IPersonalizavel):
    def __init__(self, modelo: str):
        self.modelo = modelo
        self.velocidade = 200  # km/h

    def hackear(self):
        print(f"O sistema do {self.modelo} foi hackeado! Controle remoto ativado.")

    def upgrade(self, custo: int):
        self.velocidade += 20
        print(f"{self.modelo} recebeu um upgrade de {custo} créditos. Velocidade agora: {self.velocidade} km/h")


# ============================
# Função principal (main)
# ============================

if __name__ == "__main__":
    # Instâncias
    runner = NetRunner("V")
    carro = CarroDeRua("Quadra Turbo-R")

    # Lista de hackeáveis (interface IHackeavel)
    hackeaveis: List[IHackeavel] = [runner, carro]

    print("=== Hackeando todos os alvos ===")
    for item in hackeaveis:
        item.hackear()

    # Lista de personalizáveis (interface IPersonalizavel)
    personalizaveis: List[IPersonalizavel] = [runner, carro]

    print("\n=== Aplicando upgrades ===")
    for item in personalizaveis:
        item.upgrade(500)
