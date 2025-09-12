package main

import (
	"fmt"
)

func main() {
	var numero int

	fmt.Print("Digite um número inteiro: ")
	fmt.Scanln(&numero)

	switch numero % 2 {
	case 0:
		fmt.Printf("O número %d é par.\n", numero)
	default:
		fmt.Printf("O número %d é ímpar.\n", numero)
	}
}
