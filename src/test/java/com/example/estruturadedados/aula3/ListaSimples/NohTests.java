package com.example.estruturadedados.aula3.ListaSimples;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import java.util.Arrays;
import static org.junit.jupiter.api.Assertions.assertNull;

public class NohTests {
    @Test
    void createANoh() {
        Arrays.asList(1, 1.5, "Gustavo").forEach(valor -> {
            Noh noh = new Noh(valor);
            assertEquals(valor, noh.getValor());
        });
    }

    @Test void nextNode() {
        Noh noh = new Noh(1);

        assertNull(noh.getProximo());

        Noh noh2 = new Noh(2);
        noh.setProximo(noh2);
        assertEquals(noh2, noh.getProximo());

        Noh noh3 = new Noh(3);
        noh2.setProximo(noh3);
        assertEquals(noh3, noh2.getProximo());
    }
}
