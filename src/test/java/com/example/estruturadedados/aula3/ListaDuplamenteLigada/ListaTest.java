package com.example.estruturadedados.aula3.ListaDuplamenteLigada;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ListaTest {

    @Test
    void testInit() {
        Lista lista = new Lista();
        assertEquals(0, lista.tam);
        assertNull(lista.primeiro);
        assertNull(lista.ultimo);
    }

    @Test
    void testAdicionarPrimeiro() {
        Lista lista = new Lista();
        lista.adicionar(0);
        assertEquals(1, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(0, primeiro.valor);
        assertEquals(primeiro, lista.ultimo);
        assertNull(primeiro.esquerdo);
        assertNull(primeiro.direito);
    }

    @Test
    void testAdicionarSegundo() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        assertEquals(2, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(0, primeiro.valor);
        Noh ultimo = lista.ultimo;
        assertEquals(1, ultimo.valor);
        assertEquals(primeiro, ultimo.esquerdo);
        assertEquals(ultimo, primeiro.direito);
        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testAdicionarTerceiro() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        lista.adicionar(2);
        assertEquals(3, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(0, primeiro.valor);
        Noh ultimo = lista.ultimo;
        Noh segundo = primeiro.direito;
        assertEquals(1, segundo.valor);
        assertEquals(2, ultimo.valor);

        assertEquals(primeiro, segundo.esquerdo);

        assertEquals(segundo, ultimo.esquerdo);
        assertEquals(ultimo, segundo.direito);

        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testAdicionarPrimeiroAEsqerda() {
        Lista lista = new Lista();
        lista.adicionarAEsquerda(0);
        assertEquals(1, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(0, primeiro.valor);
        assertEquals(primeiro, lista.ultimo);
        assertNull(primeiro.esquerdo);
        assertNull(primeiro.direito);
    }

    @Test
    void testAdicionarSegundoAEsqerda() {
        Lista lista = new Lista();
        lista.adicionarAEsquerda(0);
        lista.adicionarAEsquerda(1);
        assertEquals(2, lista.tam);
        Noh primeiro = lista.primeiro;
            assertEquals(1, primeiro.valor);
        Noh ultimo = lista.ultimo;
        assertEquals(0, ultimo.valor);
        assertEquals(primeiro, ultimo.esquerdo);
        assertEquals(ultimo, primeiro.direito);
        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testAdicionarTerceiroAEsqerda() {
        Lista lista = new Lista();
        lista.adicionarAEsquerda(0);
        lista.adicionarAEsquerda(1);
        lista.adicionarAEsquerda(2);
        assertEquals(3, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(2, primeiro.valor);
        Noh ultimo = lista.ultimo;
        Noh segundo = primeiro.direito;
        assertEquals(1, segundo.valor);
        assertEquals(0, ultimo.valor);

        assertEquals(primeiro, segundo.esquerdo);

        assertEquals(segundo, ultimo.esquerdo);
        assertEquals(ultimo, segundo.direito);

        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testRemoverListaVazia() {
        Lista lista = new Lista();
        assertThrows(RuntimeException.class, () -> lista.remover());
    }

    @Test
    void testRemoverLista1Elemento() {
        Lista lista = new Lista();
        lista.adicionar(0);
        assertEquals(0, lista.remover());
        assertEquals(0, lista.tam);
        assertNull(lista.primeiro);
        assertNull(lista.ultimo);
    }

    @Test
    void testRemoverLista2Elementos() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        assertEquals(1, lista.remover());
        assertEquals(1, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(primeiro, lista.ultimo);
        assertEquals(0, primeiro.valor);
        assertNull(primeiro.direito);
        assertNull(primeiro.esquerdo);
    }

    @Test
    void testRemoverLista3Elementos() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        lista.adicionar(2);
        assertEquals(2, lista.remover());
        assertEquals(2, lista.tam);
        Noh primeiro = lista.primeiro;
        Noh ultimo = lista.ultimo;
        assertEquals(ultimo, primeiro.direito);
        assertEquals(primeiro, ultimo.esquerdo);
        assertEquals(0, primeiro.valor);
        assertEquals(1, ultimo.valor);
        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testRemoverAEsqerdaListaVazia() {
        Lista lista = new Lista();
        assertThrows(RuntimeException.class, () -> lista.removerAEsquerda());
    }

    @Test
    void testRemoverAEsqerdaLista1Elemento() {
        Lista lista = new Lista();
        lista.adicionar(0);
        assertEquals(0, lista.removerAEsquerda());
        assertEquals(0, lista.tam);
        assertNull(lista.primeiro);
        assertNull(lista.ultimo);
    }

    @Test
    void testRemoverAEsqerdaLista2Elementos() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        assertEquals(0, lista.removerAEsquerda());
        assertEquals(1, lista.tam);
        Noh primeiro = lista.primeiro;
        assertEquals(primeiro, lista.ultimo);
        assertEquals(1, primeiro.valor);
        assertNull(primeiro.direito);
        assertNull(primeiro.esquerdo);
    }

    @Test
    void testRemoverAEsqerdaLista3Elementos() {
        Lista lista = new Lista();
        lista.adicionar(0);
        lista.adicionar(1);
        lista.adicionar(2);
        assertEquals(0, lista.removerAEsquerda());
        assertEquals(2, lista.tam);
        Noh primeiro = lista.primeiro;
        Noh ultimo = lista.ultimo;
        assertEquals(ultimo, primeiro.direito);
        assertEquals(primeiro, ultimo.esquerdo);
        assertEquals(1, primeiro.valor);
        assertEquals(2, ultimo.valor);
        assertNull(primeiro.esquerdo);
        assertNull(ultimo.direito);
    }

    @Test
    void testIterarListaNaoVazia() {
        Lista lista = new Lista();
        int[] numeros = {0, 1, 2};
        for (int n : numeros) {
            lista.adicionar(n);
        }
        int[] array = lista.toArray();
        assertArrayEquals(numeros, array);
    }


}
