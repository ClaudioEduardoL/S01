public class Main {
    public static void main(String[] args) {
        PadraoAtaque fireball = new PadraoAtaque("Fireball", 50);
        PadraoAtaque slash = new PadraoAtaque("Slash", 30);

        Boss bossNormal = new Boss("Golem de Pedra", "B1", "Magia");
        bossNormal.adicionarAtaque(slash);

        BossMagico bossMagico = new BossMagico("Arquimago Sombrio", "B2", "Luz");
        bossMagico.adicionarAtaque(fireball);

        Batalha batalha = new Batalha();
        batalha.adicionarBoss(bossNormal);
        batalha.adicionarBoss(bossMagico);

        batalha.iniciarBatalha("B1");
        batalha.iniciarBatalha("B2");
    }
}
