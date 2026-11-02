package com.example.estruturadedados.aula6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashMap;

import org.junit.jupiter.api.Test;

public class CalculoTrocoTests {
    @Test
    void testeCalculoTroco() {
        var calculoTroco = new CalculoTroco();
        var notas = new int[] { 10};

        var troco = new HashMap<Integer, Integer>();
        assertEquals(troco, calculoTroco.calcularTroco(9, notas));
    }

    @Test
    void calculaTroco10() {
        var calculoTroco = new CalculoTroco();
        var notas = new int[] { 10 };

        var troco = new HashMap<Integer, Integer>();
        troco.put(10, 1);
        assertEquals(troco, calculoTroco.calcularTroco(10, notas));
    }

    @Test
    void calculaTroco29() {
        var calculoTroco = new CalculoTroco();
        var notas = new int[] { 10, 5, 2, 1 };

        var troco = new HashMap<Integer, Integer>();
        troco.put(10, 2);
        troco.put(5, 1);
        troco.put(2, 2);
        troco.put(1, 0);
        assertEquals(troco, calculoTroco.calcularTroco(29, notas));
    }
}
