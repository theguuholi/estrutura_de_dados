package com.example.estruturadedados.aula3.ListaDuplamenteLigada;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class ListaTest {

    @Test
    void testInitComValoresPadrao() {
        Noh noh = new Noh(4);
        assertEquals(4, noh.valor);
        assertNull(noh.esquerdo);
        assertNull(noh.direito);
    }

    @Test
    void testInitComNoEsquerdo() {
        Noh esquerdo = new Noh(1);
        Noh noh = new Noh(2, esquerdo);
        assertEquals(esquerdo, noh.esquerdo);
        assertNull(noh.direito);
    }

    @Test
    void testInitComNoDireito() {
        Noh direito = new Noh(1);
        Noh noh = new Noh(2, null, direito);
        assertEquals(direito, noh.direito);
        assertNull(noh.esquerdo);
    }

    @Test
    void testInitComNoEsquerdoEDireito() {
        Noh esquerdo = new Noh(1);
        Noh direito = new Noh(2);
        Noh noh = new Noh(3, esquerdo, direito);
        assertEquals(esquerdo, noh.esquerdo);
        assertEquals(direito, noh.direito);
    }

    @Test
    void testAdicionarRemoverIterar() {
        Lista lista = new Lista();
        assertEquals(0, lista.tam);
        assertNull(lista.primeiro);
        assertNull(lista.ultimo);

        lista.adicionar(0);
        assertEquals(1, lista.tam);
        assertEquals(0, lista.primeiro.valor);
        assertEquals(lista.primeiro, lista.ultimo);

        lista.adicionar(1);
        assertEquals(2, lista.tam);
        assertEquals(1, lista.ultimo.valor);

        lista.adicionar(2);
        assertEquals(3, lista.tam);
        assertEquals(2, lista.ultimo.valor);

        // int valorRemovido = lista.remover();
        // assertEquals(0, valorRemovido);
        // assertEquals(2, lista.tam);
        // assertEquals(1, lista.primeiro.valor);


        // valorRemovido = lista.remover_a_esquerda();
        // assertEquals(0, valorRemovido);
        // assertEquals(1, lista.tam);

        // int[] esperados = { 1 };
        // int i = 0;
        // for (int val : lista) {
        //     assertEquals(esperados[i++], val);
        // }
    }

    // @Test
    // void testRemoverListaVazia() {
    //     ListaDuplamenteLigada lista = new ListaDuplamenteLigada();
    //     assertThrows(ListaVaziaErro.class, lista::remover);
    //     assertThrows(ListaVaziaErro.class, lista::remover_a_esquerda);
    // }
}
