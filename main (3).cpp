#include <iostream>
using namespace std;

//Fibonacci
int fibonacci(int n) {
    if (n == 0) return 0;  
    if (n == 1) return 1;  
    return fibonacci(n - 1) + fibonacci(n - 2); // Fazendo a chamada recursiva
}

int main() {
    int n;

    cout << "=== Sequência de Fibonacci com Recursividade ===" << endl;
    cout << "Digite um número inteiro: ";
    cin >> n;

    cout << "O " << n << " termo da sequência de Fibonacci é: " 
         << fibonacci(n) << endl;

    return 0;
}
