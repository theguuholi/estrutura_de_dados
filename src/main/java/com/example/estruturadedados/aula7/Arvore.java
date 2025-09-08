package com.example.estruturadedados.aula7;

import java.util.LinkedList;

class Tupla {
    private Integer altura;
    private ArvoreNoh noh;

    public Tupla(Integer altura, ArvoreNoh noh) {
        this.altura = altura;
        this.noh = noh;
    }

    public Integer getAltura() {
        return altura;
    }

    public ArvoreNoh getNoh() {
        return noh;
    }
}

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
        if (this.raiz == null) return alturaAtual;

        var alturaMaxima = 1;
        var fila = new LinkedList<Tupla>();
        fila.add(new Tupla(1, this.raiz));

        while (!fila.isEmpty()) {
            var tuplaAtual = fila.remove();
            var nohAtual = tuplaAtual.getNoh();
            var alturaAtualNoh = tuplaAtual.getAltura();

            alturaMaxima = Math.max(alturaMaxima, alturaAtualNoh);

            var filho = nohAtual.getFilhoEsquerdo();
            while (filho != null) {
                fila.add(new Tupla(alturaAtualNoh + 1, filho));
                filho = filho.getIrmaoDireito();
            }
        }
        return alturaMaxima;
    }

}
