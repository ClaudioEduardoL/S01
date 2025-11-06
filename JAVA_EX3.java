public class Main {
    public static void main(String[] args) {
        Poder poder1 = new Poder("Telepatia");
        Poder poder2 = new Poder("Controle Elemental");

        Alien alien1 = new Alien("Zorg", "Marte", "Disco V-22", poder1);
        Youkai youkai1 = new Youkai("Kitsune", "Floresta Sagrada", poder2);

        Registros registros = new Registros("Equipe Oculta");

        registros.registrarAvistamento(alien1);
        registros.registrarAvistamento(youkai1);

        // Tentando registrar novamente o mesmo nome
        registros.registrarAvistamento(alien1);

        registros.listarAvistamentos();
    }
}
