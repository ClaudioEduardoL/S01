#include <iostream>
using namespace std;

// Função para somar os valores de um array
float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;

    cout << "=== Somatório de Array ===" << endl;
    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho];  // Criandp o array com o tamanho informado

    cout << "Digite os " << tamanho << " valores do array:" << endl;
    for (int i = 0; i < tamanho; i++) {
        cout << "Elemento [" << i << "]: ";
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);

    cout << "\nA soma dos elementos do array é: " << resultado << endl;

    return 0;
}
