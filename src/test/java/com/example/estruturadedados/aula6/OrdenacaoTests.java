package com.example.estruturadedados.aula6;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

public class OrdenacaoTests {
    @Test
    void testeOrdenacao() {
        var ordenacao = new Ordenacao();
        ordenacao.selectionSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });
    }

    @Test
    void testeOrdenacaoBubbleSort() {
        var ordenacao = new Ordenacao();
        ordenacao.bubbleSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });
    }
}
