package main

import "testing"

func TestSoma(t *testing.T) {

	total := Soma(5, 25)

	if total != 30 {
		t.Errorf("Resultado da soma é inválido! Resultado: %d. Esperado: %d.", total, 30)
	}
}
