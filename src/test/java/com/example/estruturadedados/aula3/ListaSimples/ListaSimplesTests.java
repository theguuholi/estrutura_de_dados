package com.example.estruturadedados.aula3.ListaSimples;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

public class ListaSimplesTests {
    @Test
    void createAList() {
        ListaSimples lista = new ListaSimples();
        assertEquals(0, lista.size());
        assertNull(lista.getHead());
    }

    @Test
    void getFirstValue() {
        ListaSimples lista = new ListaSimples();
        assertNull(lista.getHead());
    }

    @Test
    void addAValue() {
        ListaSimples lista = new ListaSimples();
        lista.add(1);
        assertEquals(1, lista.size());
        assertEquals(1, lista.getHead().getValor());
    }

    @Test
    void addTwoValues() {
        ListaSimples lista = new ListaSimples();
        lista.add(1);
        lista.add(2);
        assertEquals(2, lista.size());
        assertEquals(2, lista.getHead().getProximo().getValor());
    }

    @Test
    void addThreeValues() {
        ListaSimples lista = new ListaSimples();
        lista.add(1);
        lista.add(2);
        lista.add(3);
        assertEquals(3, lista.size());
        assertEquals(3, lista.getHead().getProximo().getProximo().getValor());
    }

    @Test
    void getItem() {
        ListaSimples lista = new ListaSimples();
        lista.add(1);
        lista.add(2);
        lista.add(3);
        assertEquals(1, lista.getItem(0));
        assertEquals(2, lista.getItem(1));
        assertEquals(3, lista.getItem(2));
    }

    @Test
    void addWithIndex() {
        ListaSimples lista = new ListaSimples();
        lista.add(1);
        lista.add(2);
        lista.add(3, 0);
        assertEquals(3, lista.getItem(0));
        assertEquals(1, lista.getItem(1));
        assertEquals(2, lista.getItem(2));
    }

    // @Test 
    // void removeElement() {
    //     ListaSimples lista = new ListaSimples();
    //     lista.add(1);
    //     lista.add(2);
    //     lista.add(3);
    //     lista.remove(2);
    //     assertEquals(2, lista.size());
    //     assertEquals(1, lista.getItem(0));
    //     assertEquals(3, lista.getItem(1));
    // }

}
