package com.example.estruturadedados.aula3.ListaDuplamenteLigada;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class NohTest {

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
        Noh noh3 = new Noh(3, esquerdo);
        assertEquals(esquerdo, noh3.esquerdo);
        assertNull(noh3.direito);
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

}
