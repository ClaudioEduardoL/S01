using System;
using System.Collections.Generic;

namespace EvolucoesETipos
{
    // 1. Classe base
    class Pokemon
    {
        public string Nome { get; set; }

        public Pokemon(string nome)
        {
            Nome = nome;
        }

        // 2. Método virtual genérico
        public virtual void Atacar()
        {
            Console.WriteLine($"{Nome} realiza um ataque genérico!");
        }
    }

    // 3. Classe derivada: Pokémon de Fogo
    class PokemonDeFogo : Pokemon
    {
        public PokemonDeFogo(string nome) : base(nome) { }

        // 4. Sobrescrita do método Atacar()
        public override void Atacar()
        {
            Console.WriteLine($"{Nome} lança uma rajada de fogo!");
        }
    }

    // 3. Classe derivada: Pokémon de Água
    class PokemonDeAgua : Pokemon
    {
        public PokemonDeAgua(string nome) : base(nome) { }

        // 4. Sobrescrita do método Atacar()
        public override void Atacar()
        {
            Console.WriteLine($"{Nome} lança um jato de água!");
        }
    }

    // Classe principal
    class Program
    {
        static void Main(string[] args)
        {
            // 5. Criação da lista de Pokémon
            List<Pokemon> pokemons = new List<Pokemon>();

            // 6. Adiciona instâncias à lista
            pokemons.Add(new PokemonDeFogo("Charizard"));
            pokemons.Add(new PokemonDeAgua("Blastoise"));

            // Percorre a lista e executa o método Atacar()
            foreach (var p in pokemons)
            {
                p.Atacar();
            }

            Console.WriteLine("\nPressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}
