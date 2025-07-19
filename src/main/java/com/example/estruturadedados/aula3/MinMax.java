package com.example.estruturadedados.aula3;

import java.util.Arrays;

public class MinMax {

    public static int[] execute(int[] numeros) {
        int min = numeros[0];
        int max = numeros[0];
        for(int i = 0; i < numeros.length; i++) {
            if(numeros[i] < min) min = numeros[i];
            if(numeros[i] > max) max = numeros[i];
        }
        return new int[] {min, max};
    }

    public static int[] recursive(int[] numeros) {
        return recursive(numeros, numeros[0], numeros[0]);
    }

    private static int[] recursive(int[] numeros, int min, int max) {
        if(numeros.length == 0) return new int[] {min, max};
        if(numeros[0] < min) min = numeros[0];
        if(numeros[0] > max) max = numeros[0];
        return recursive(Arrays.copyOfRange(numeros, 1, numeros.length), min, max);
    }
    
}
