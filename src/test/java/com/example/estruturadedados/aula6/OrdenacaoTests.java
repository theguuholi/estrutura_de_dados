package com.example.estruturadedados.aula6;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;

public class OrdenacaoTests {
    @Test
    void testeOrdenacao() {
        var ordenacao = new Ordenacao();
        ordenacao.selectionSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });

        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });

        ordenacao.selectionSort(new int[] { 2, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2 });

        ordenacao.selectionSort(new int[] { 9, 7, 1, 8, 5, 3, 6, 4, 2, 0 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });


        ordenacao.selectionSort(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
    }

    @Test
    void testeOrdenacaoBubbleSort() {
        var ordenacao = new Ordenacao();
        ordenacao.bubbleSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });

        ordenacao.bubbleSort(new int[] { 2, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2 });

        ordenacao.bubbleSort(new int[] { 9, 7, 1, 8, 5, 3, 6, 4, 2, 0 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });

        ordenacao.bubbleSort(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
    }

    @Test
    void testeOrdenacaoInsertionSort() {
        var ordenacao = new Ordenacao();
        ordenacao.insertionSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });

        ordenacao.insertionSort(new int[] { 2, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2 });

        ordenacao.insertionSort(new int[] { 9, 7, 1, 8, 5, 3, 6, 4, 2, 0 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });

        ordenacao.insertionSort(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
    }

    @Test
    void testOrdernaccaoMergeSort() {
        var ordenacao = new Ordenacao();
        ordenacao.mergeSort(new int[] { 5, 3, 2, 4, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2, 3, 4, 5 });

        ordenacao.mergeSort(new int[] { 2, 1 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 1, 2 });

        ordenacao.mergeSort(new int[] { 9, 7, 1, 8, 5, 3, 6, 4, 2, 0 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });

        ordenacao.mergeSort(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        assertArrayEquals(ordenacao.getArray(), new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
    }
}
