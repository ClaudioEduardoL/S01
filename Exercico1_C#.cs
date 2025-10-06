using System;

namespace SociedadeDoAnel
{
    // 1. Classe MembroDaSociedade
    class MembroDaSociedade
    {
        // 2. Atributos privados
        private string nome;
        private string raca;
        private string funcao;

        // 3. Construtor com inicialização obrigatória
        public MembroDaSociedade(string nome, string raca, string funcao)
        {
            this.nome = nome;
            this.raca = raca;
            this.funcao = funcao;
        }

        // 4. Método Descrever()
        public void Descrever()
        {
            Console.WriteLine("----- Membro da Sociedade do Anel -----");
            Console.WriteLine($"Nome: {nome}");
            Console.WriteLine($"Raça: {raca}");
            Console.WriteLine($"Função: {funcao}");
            Console.WriteLine("---------------------------------------\n");
        }
    }

    // Classe principal (Main)
    class Program
    {
        static void Main(string[] args)
        {
            // 5. Criação das instâncias e chamada do método
            MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardião");
            MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

            // Chamando o método Descrever()
            aragorn.Descrever();
            legolas.Descrever();

            // Mantém a janela aberta até pressionar uma tecla
            Console.WriteLine("Pressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}
