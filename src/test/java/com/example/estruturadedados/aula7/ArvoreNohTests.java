package com.example.estruturadedados.aula7;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

public class ArvoreNohTests {

    @Test
    public void testInitWithDefaults() {
        var noh = new ArvoreNoh(5);
        assertEquals(5, noh.getValor());
        assertNull(noh.getPai());
        assertNull(noh.getIrmaoDireito());
        assertNull(noh.getFilhoEsquerdo());
    }

    @Test
    public void testInitWithParentJustApost() {
        var pai = new ArvoreNoh(5);
        var filho = new ArvoreNoh(4, pai);
        assertEquals(pai, filho.getPai());
        assertEquals(filho, pai.getFilhoEsquerdo());
    }

    @Test
    public void testInitWithNamedParent() {
        var pai = new ArvoreNoh(5);
        var filho = new ArvoreNoh(4, pai);
        assertEquals(pai, filho.getPai());
        assertEquals(filho, pai.getFilhoEsquerdo());
    }

    @Test
    public void testAddOneChild() {
        var pai = new ArvoreNoh(5);
        var filho = new ArvoreNoh(4);
        pai.adicionar(filho);
        assertEquals(pai, filho.getPai());
        assertEquals(filho, pai.getFilhoEsquerdo());
        assertEquals(null, pai.getIrmaoDireito());
    }

    @Test
    public void testAddTwoChildren() {
        var pai = new ArvoreNoh(5);
        var filho = new ArvoreNoh(4);
        var filho2 = new ArvoreNoh(3);
        pai.adicionar(filho);
        pai.adicionar(filho2);
        assertEquals(pai, filho.getPai());
        assertEquals(filho, pai.getFilhoEsquerdo());
        assertEquals(filho2, filho.getIrmaoDireito());
        assertNull(filho2.getIrmaoDireito());
    }


    @Test
    public void testAddThreeChildren() {
        var pai = new ArvoreNoh(5);
        var filho = new ArvoreNoh(4);
        var filho2 = new ArvoreNoh(3);
        var filho3 = new ArvoreNoh(2);
        pai.adicionar(filho);
        pai.adicionar(filho2);
        pai.adicionar(filho3);
        assertEquals(pai, filho.getPai());
        assertEquals(filho, pai.getFilhoEsquerdo());
        assertEquals(filho2, filho.getIrmaoDireito());
        assertEquals(filho3, filho2.getIrmaoDireito());
        assertNull(filho3.getIrmaoDireito());
    }



}
