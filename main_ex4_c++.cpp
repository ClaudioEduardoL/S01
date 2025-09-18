#include <iostream>
using namespace std;

// Função para converter Celsius em Fahrenheit
double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

// Função para converter Fahrenheit em Celsius
double fahrenheitParaCelsius(double fahrenheit) {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
}

int main() {
    int opcao;
    double temperatura;

    cout << "=== Conversor de Unidades Interativo ===" << endl;

    do {
        cout << "\nEscolha uma opção:" << endl;
        cout << "1. Converter Celsius para Fahrenheit" << endl;
        cout << "2. Converter Fahrenheit para Celsius" << endl;
        cout << "3. Sair" << endl;
        cout << "Opção: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> temperatura;
                cout << "Resultado: " << celsiusParaFahrenheit(temperatura)
                     << " °F" << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Fahrenheit: ";
                cin >> temperatura;
                cout << "Resultado: " << fahrenheitParaCelsius(temperatura)
                     << " °C" << endl;
                break;

            case 3:
                cout << "Saindo do programa..." << endl;
                break;

            default:
                cout << "Opção inválida! Tente novamente." << endl;
        }
    } while (opcao != 3);

    return 0;
}
