package com.example.estruturadedados;

public class MaxCalculation {
    public static int meuMax(int[] iteravel) {
        int numeroMaximo = iteravel[0]; // O(1)
        for (int i = 1; i < iteravel.length; i++) { // O(n)
            if (iteravel[i] > numeroMaximo) { // O(1)
                numeroMaximo = iteravel[i]; // O(1)
            }
        }
        return numeroMaximo; // O(1)
    }
}
