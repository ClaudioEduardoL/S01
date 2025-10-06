using System;

namespace HordaSombria
{
    // 1) Classe base abstrata
    abstract class MonstroSombrio
    {
        public string Nome { get; private set; }

        protected MonstroSombrio(string nome)
        {
            Nome = nome;
        }

        // Método virtual para permitir comportamento padrão (opcional)
        public virtual void Mover()
        {
            Console.WriteLine($"{Nome} se move nas sombras.");
        }
    }

    // 2) Zumbi (lento)
    class Zumbi : MonstroSombrio
    {
        public Zumbi(string nome) : base(nome) { }

        // 3) Sobrescrita refletindo a natureza lenta
        public override void Mover()
        {
            Console.WriteLine($"{Nome} (Zumbi) cambaleia lentamente pelo corredor...");
        }
    }

    // 2) Espectro (rápido)
    class Espectro : MonstroSombrio
    {
        public Espectro(string nome) : base(nome) { }

        // 3) Sobrescrita refletindo a natureza etérea/rápida
        public override void Mover()
        {
            Console.WriteLine($"{Nome} (Espectro) desliza rapidamente, atravessando paredes...");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            // 4) Array do tipo da classe mãe com instâncias diversas
            MonstroSombrio[] horda = new MonstroSombrio[]
            {
                new Zumbi("Morth"),
                new Espectro("Vhal"),
                new Zumbi("Graak"),
                new Espectro("Nyx")
            };

            // 5) Processamento uniforme (polimorfismo)
            foreach (var monstro in horda)
            {
                monstro.Mover();
            }

            Console.WriteLine("\nPressione qualquer tecla para sair...");
            Console.ReadKey();
        }
    }
}
