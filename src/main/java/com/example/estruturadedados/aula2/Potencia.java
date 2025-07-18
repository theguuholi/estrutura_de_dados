package com.example.estruturadedados.aula2;

public class Potencia {
    public static void main(String[] args) {
        System.out.println(potenciaIterativa(2, 3));
        System.out.println(potenciaRecursiva(2, 3));
        System.out.println(potenciaRecursivaOtimizada(2, 3));
    }

    private static int potenciaIterativa(int base, int expoente) {
        int resultado = 1;
        for (int i = 0; i < expoente; i++) {
            resultado *= base;
        }
        return resultado;
    }

    private static int potenciaRecursiva(int base, int expoente) {
        if (expoente == 0) {
            return 1;
        }
        return base * potenciaRecursiva(base, expoente - 1);
    }

    private static int potenciaRecursivaOtimizada(int base, int expoente) {
        if (expoente == 0) {
            return 1;
        }
        if (expoente % 2 == 0) {
            return potenciaRecursivaOtimizada(base, expoente / 2) * potenciaRecursivaOtimizada(base, expoente / 2);
        }
        return base * potenciaRecursivaOtimizada(base, expoente / 2) * potenciaRecursivaOtimizada(base, expoente / 2);
    }
}
