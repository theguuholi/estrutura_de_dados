package com.example.estruturadedados.aula3.ListaDuplamenteLigada;

public class Lista {
    public int tam = 0;
    public Noh primeiro;
    public Noh ultimo;

    public void adicionar(int valor) {
        Noh novo = new Noh(valor);
        if (primeiro == null) {
            primeiro = ultimo = novo;
        } else {
            novo.esquerdo = ultimo;
            ultimo.direito = novo;
            ultimo = novo;
        }
        tam++;
    }
}
