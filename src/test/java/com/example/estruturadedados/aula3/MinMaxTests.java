package com.example.estruturadedados.aula3;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class MinMaxTests {
    @Test
    public void testMinMax() {
        int[] numeros = {1, 2, 3, 4, 5};
        int[] resultado = MinMax.execute(numeros);
        assertEquals(1, resultado[0]);
        assertEquals(5, resultado[1]);

        numeros = new int[] {5, 4, 3, 2, 1};
        resultado = MinMax.execute(numeros);
        assertEquals(1, resultado[0]);
        assertEquals(5, resultado[1]);
    }

    @Test
    public void testMinMaxRecursive() {
        int[] numeros = {1, 2, 3, 4, 5};
        int[] resultado = MinMax.recursive(numeros);
        assertEquals(1, resultado[0]);
        assertEquals(5, resultado[1]);
    }
}
