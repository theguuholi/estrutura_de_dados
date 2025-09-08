package com.example.estruturadedados.aula7;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

public class ArvoreTests {

    @Test
    public void testInit() {
        Arvore arvore = new Arvore();
        assertNull(arvore.getRaiz());
    }

    @Test
    public void testArvoreComRaiz() {
        ArvoreNoh noh = new ArvoreNoh(1);
        Arvore arvore = new Arvore(noh);
        assertEquals(noh, arvore.getRaiz());
    }

    @Test
    public void testAlturaArvore() {
        Arvore arvoreVazia = new Arvore();
        assertEquals(0, arvoreVazia.altura());

        // ArvoreNoh noh = new ArvoreNoh(1);
        // Arvore arvore = new Arvore(noh);
        // assertEquals(1, arvore.altura());

        Arvore arvoreBinaria = testGerarArvoreBinaria();
        assertEquals(4, arvoreBinaria.altura());
    }

    public Arvore testGerarArvoreBinaria() {
        // Create nodes 0-9
        ArvoreNoh[] nohs = new ArvoreNoh[10];
        for (int i = 0; i < 10; i++) {
            nohs[i] = new ArvoreNoh(i);
        }

        // Build tree structure
        /*
                                5
                  2                       8
            1         4             7          9
        0          3             6
        */
        ArvoreNoh raiz = nohs[5];
        raiz.adicionar(nohs[2]);
        raiz.adicionar(nohs[8]);

        nohs[2].adicionar(nohs[1]); 
        nohs[2].adicionar(nohs[4]);

        nohs[1].adicionar(nohs[0]);

        nohs[4].adicionar(nohs[3]);

        nohs[8].adicionar(nohs[7]);
        nohs[8].adicionar(nohs[9]);

        nohs[7].adicionar(nohs[6]);

        Arvore arvore = new Arvore(raiz);
        assertEquals(raiz, arvore.getRaiz());
        return arvore;
    }

}
