package com.example.estruturadedados.aula2;

public class TorreHannoi {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Torre de Hanoi com " + i + " discos"); // O(1)
            torreHannoi(i, 'A', 'B', 'C'); // O(n**2)
            System.out.println("--------------------------------"); // O(1)
        }
    }

    private static void torreHannoi(int numeroDeDiscos, char origem, char destino, char auxiliar) {
        if (numeroDeDiscos == 1) { // O(1)
            System.out.println("origem " + origem + " -> " + destino + " : " + numeroDeDiscos); // O(1)
            return;
        }
        torreHannoi(numeroDeDiscos - 1, origem, auxiliar, destino); // O(n)
        System.out.println("origem " + origem + " -> " + destino + " : " + numeroDeDiscos); // O(1)
        torreHannoi(numeroDeDiscos - 1, auxiliar, destino, origem); // O(n)
    }
}
