using System;
using System.Collections.Generic;

namespace ArmazenamentoMagico
{
    // 1. Classe Feitico (propriedades)
    class Feitico
    {
        public string Nome { get; set; }

        public Feitico(string nome)
        {
            Nome = nome;
        }
    }

    // 2. Classe Grimorio (Composição)
    class Grimorio
    {
        public List<Feitico> Feiticos { get; private set; }

        public Grimorio()
        {
            Feiticos = new List<Feitico>();
        }

        public void AdicionarFeitico(Feitico f)
        {
            Feiticos.Add(f);
        }
    }

    // 3. Classe Ferramenta
    class Ferramenta
    {
        public string Nome { get; set; }

        public Ferramenta(string nome)
        {
            Nome = nome;
        }
    }

    // 4. Classe Maga (Frieren)
    class Maga
    {
        public string Nome { get; private set; }
        public Grimorio Grimorio { get; private set; } // Composição
        public List<Ferramenta> Ferramentas { get; set; } // Agregação

        public Maga(string nome)
        {
            Nome = nome;
            Grimorio = new Grimorio(); // Parte essencial — composição
        }
    }

    // 5. Classe principal
    class Program
    {
        static void Main(string[] args)
        {
            // Cria lista de ferramentas (Agregação)
            List<Ferramenta> ferramentas = new List<Ferramenta>()
            {
                new Ferramenta("Capacete"),
                new Ferramenta("Lanterna")
            };

            // Cria maga e associa ferramentas
            Maga frieren = new Maga("Frieren")
            {
                Ferramentas = ferramentas
            };

            // Adiciona feitiços ao grimório (Composição)
            frieren.Grimorio.AdicionarFeitico(new Feitico("Explosão Arcana"));
            frieren.Grimorio.AdicionarFeitico(new Feitico("Campo de Proteção"));

            // Exibição dos dados
            Console.WriteLine($"Maga: {frieren.Nome}");
            Console.WriteLine("\nFeitiços do Grimório:");
            foreach (var f in frieren.Grimorio.Feiticos)
                Console.WriteLine($"- {f.Nome}");

            Console.WriteLine("\nFerramentas agregadas:");
            foreach (var ferr in frieren.Ferramentas)
                Console.WriteLine($"- {ferr.Nome}");

            Console.WriteLine("\nPressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}
