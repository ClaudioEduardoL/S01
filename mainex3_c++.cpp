#include <iostream>
using namespace std;

int main() {
    int quantidade;
    float nota, soma = 0;

    cout << "=== Média de Notas com Validação ===" << endl;
    cout << "Quantas notas deseja inserir? ";
    cin >> quantidade;

    // Loop principal
    for (int i = 0; i < quantidade; i++) {
        do {
            cout << "Digite a nota " << (i + 1) << " (0 a 10): ";
            cin >> nota;

            if (nota < 0 || nota > 10) {
                cout << "Nota inválida! Tente novamente." << endl;
            }

        } while (nota < 0 || nota > 10); // Validação da nota

        soma += nota; // Acumula as notas válidas
    }

    // Calcula a média
    float media = soma / quantidade;

    cout << "\nMédia final: " << media << endl;

    if (media >= 7) {
        cout << "Resultado: Aprovado" << endl;
    } else {
        cout << "Resultado: Reprovado" << endl;
    }

    return 0;
}
