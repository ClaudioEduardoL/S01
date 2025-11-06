import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        // Cria um menu vazio
        Menu menu = new Menu(new ArrayList<>());

        // Cria a cafeteria com o menu (composição)
        CafeLeblanc cafeteria = new CafeLeblanc(menu);

        // Cria cafés
        Cafe cafeNormal = new Cafe("Café Preto", 5.00);
        CafeGourmet cafeGourmet = new CafeGourmet("Café Gourmet Especial", 7.00, 3.00);

        // Recebe pedidos (polimorfismo em calcularPrecoFinal)
        cafeteria.receberPedido(cafeNormal);
        cafeteria.receberPedido(cafeGourmet);

        // Listar itens do menu
        System.out.println("\nItens no menu:");
        for (Cafe c : cafeteria.getMenu().getItens()) {
            System.out.println("- " + c.getNome() + " | R$ " + c.calcularPrecoFinal());
        }
    }
}
