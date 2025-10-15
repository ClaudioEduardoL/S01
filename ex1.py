# Classe base Personagem
class Personagem:
    def __init__(self, vida: int, resistencia: int):
        # Atributos "privados" com encapsulamento
        self._vida = vida
        self._resistencia = resistencia

    # Propriedade Vida
    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, valor):
        if valor >= 0:
            self._vida = valor
        else:
            raise ValueError("A vida não pode ser negativa.")

    # Propriedade Resistencia
    @property
    def resistencia(self):
        return self._resistencia

    @resistencia.setter
    def resistencia(self, valor):
        if valor >= 0:
            self._resistencia = valor
        else:
            raise ValueError("A resistência não pode ser negativa.")

    # Método base
    def rolar(self):
        print("O personagem rola lentamente.")

# Classe filha Cavaleiro
class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    # Sobrescrita do método rolar
    def rolar(self):
        if self.armadura_pesada:
            print("O cavaleiro tenta rolar, mas sua armadura pesada o atrapalha!")
        else:
            print("O cavaleiro rola agilmente pelo campo de batalha.")

# Função principal
if __name__ == "__main__":
    cav = Cavaleiro(vida=120, resistencia=80, armadura_pesada=True)

    print(f"Vida: {cav.vida}")
    print(f"Resistência: {cav.resistencia}")
    print(f"Armadura pesada: {cav.armadura_pesada}")

    cav.rolar()
