package com.example.estruturadedados.aula3.ListaDuplamenteLigada;

public class Noh {
    public int valor;
    public Noh esquerdo;
    public Noh direito;

    public Noh(int valor) {
        this.valor = valor;
    }

    public Noh(int valor, Noh esquerdo) {
        this.valor = valor;
        this.esquerdo = esquerdo;
    }

    public Noh(int valor, Noh esquerdo, Noh direito) {
        this.valor = valor;
        this.esquerdo = esquerdo;
        this.direito = direito;
    }
    
}
