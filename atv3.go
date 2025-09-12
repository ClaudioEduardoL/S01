package main

import (
	"fmt"
)

func fibonacci(n int) {
	a, b := 0, 1
	for i := 0; i < n; i++ {
		fmt.Printf("%d ", a)
		a, b = b, a+b
	}
	fmt.Println()
}

func main() {
	var quantidade int

	fmt.Print("Digite quantos números da sequência de Fibonacci deseja gerar: ")
	fmt.Scanln(&quantidade)

	fibonacci(quantidade)
}
