package com.example.estruturadedados.aula7;

import java.util.LinkedList;

public class Arvore {

    private ArvoreNoh raiz;

    public Arvore() {
        this.raiz = null;
    }

    public Arvore(ArvoreNoh noh) {
        this.raiz = noh;
    }

    public Object getRaiz() {
        return this.raiz;
    }

    public Integer altura() {
        var alturaAtual = 0;
        var fila = new LinkedList<>();
        fila.add(this.raiz);

        return alturaAtual;
    }

}
