package com.example.estruturadedados.aula7;

public class ArvoreNoh {

    private int valor;
    private ArvoreNoh pai;
    private ArvoreNoh irmaoDireito;
    private ArvoreNoh filhoEsquerdo;

    public ArvoreNoh(int valor) {
        this.valor = valor;
        this.pai = null;
        this.irmaoDireito = null;
        this.filhoEsquerdo = null;
    }

    public ArvoreNoh(int valor, ArvoreNoh pai) {
        this.valor = valor;
        this.pai = pai;
        pai.filhoEsquerdo = this;
        this.irmaoDireito = null;
        this.filhoEsquerdo = null;
    }

    public int getValor() {
        return this.valor;
    }

    public ArvoreNoh getPai() {
        return this.pai;
    }

    public ArvoreNoh getIrmaoDireito() {
        return this.irmaoDireito;
    }

    public ArvoreNoh getFilhoEsquerdo() {
        return this.filhoEsquerdo;
    }

    public void adicionar(ArvoreNoh filho) {
        if (this.filhoEsquerdo == null) this.filhoEsquerdo = filho;
        else {
            var filhoSemIrmaoDireito = this.filhoEsquerdo;
            while(filhoSemIrmaoDireito.irmaoDireito != null) {
                filhoSemIrmaoDireito = filhoSemIrmaoDireito.irmaoDireito;
            }
            filhoSemIrmaoDireito.irmaoDireito = filho;
        }
        filho.pai = this;
    }

}
