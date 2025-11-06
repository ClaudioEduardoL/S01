import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        // Cria um mago
        Mago howl = new Mago("Howl", 27, "Chama Azul");

        // Cria algumas divisões
        Divisao sala = new Divisao("Sala Principal");
        Divisao cozinha = new Divisao("Cozinha");

        // Cria o castelo e adiciona divisões
        Castelo casteloAnimado = new Castelo("Castelo Animado");
        casteloAnimado.adicionarDivisao(sala);
        casteloAnimado.adicionarDivisao(cozinha);

        // Testa o método do mago
        System.out.println(howl.lancarFeitico());

        // Lista divisões do castelo
        System.out.println("Divisões do " + casteloAnimado.getNome() + ":");
        for (Divisao d : casteloAnimado.getDivisoes()) {
            System.out.println("- " + d.getNome());
        }
    }
}

// Classes de apoio (podem ficar em arquivos separados, se o ambiente permitir)

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public int getIdade() { return idade; }
    public void setIdade(int idade) { this.idade = idade; }
}

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }

    public String getMagia() { return magia; }
    public void setMagia(String magia) { this.magia = magia; }

    public String lancarFeitico() {
        return "O mago " + getNome() + " lançou o feitiço: " + magia;
    }
}

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    @Override
    public String toString() {
        return "Divisão: " + nome;
    }
}

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome) {
        this.nome = nome;
        this.divisoes = new ArrayList<>();
    }

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public ArrayList<Divisao> getDivisoes() { return divisoes; }

    public void adicionarDivisao(Divisao divisao) {
        if (divisao != null) {
            divisoes.add(divisao);
        }
    }
}
