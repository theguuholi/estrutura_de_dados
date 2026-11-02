package com.example.estruturadedados;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class MaxCalculationTests {
    @Test
    public void testMax() {
        int[] numeros = {1, 2, 3, 4, 5};
        long startTime = System.nanoTime();
        int resultado = MaxCalculation.meuMax(numeros);
        long endTime = System.nanoTime();
        double duration = (endTime - startTime) / 1_000_000.0;
        System.out.println("Execution time: " + duration + " milliseconds");
        assertEquals(5, resultado);
    }
}
