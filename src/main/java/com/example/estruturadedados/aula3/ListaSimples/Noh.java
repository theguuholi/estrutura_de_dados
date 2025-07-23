package com.example.estruturadedados.aula3.ListaSimples;

public class Noh {
    private Object valor;
    private Noh proximo;

    public Noh(Object valor) {
        this.valor = valor;
        this.proximo = null;
    }

    public Object getValor() {
        return valor;
    }

    public Noh getProximo() {
        return proximo;
    }

    public void setProximo(Noh proximo) {
        this.proximo = proximo;
    }
}
