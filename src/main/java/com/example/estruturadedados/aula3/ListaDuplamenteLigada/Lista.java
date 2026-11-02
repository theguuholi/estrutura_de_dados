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

    public void adicionarAEsquerda(int valor) {
        Noh novo = new Noh(valor);
        if (primeiro == null) {
            primeiro = ultimo = novo;
        } else {
            novo.direito = primeiro;
            primeiro.esquerdo = novo;
            primeiro = novo;
        }
        tam++;
    }

    public int remover() {
        if (primeiro == null) {
            throw new RuntimeException("Lista vazia");
        }
        if(primeiro == ultimo) {
            int valor = primeiro.valor;
            primeiro = null;
            ultimo = null;
            tam--;
            return valor;
        } else {
            var noh = ultimo;
            ultimo = ultimo.esquerdo;
            ultimo.direito = null;
            tam--;
            return noh.valor;
        }
    }

    public int removerAEsquerda() {
        if (primeiro == null) {
            throw new RuntimeException("Lista vazia");
        }
        if(primeiro == ultimo) {
            int valor = primeiro.valor;
            primeiro = null;
            ultimo = null;
            tam--;
            return valor;
        } else {
            var noh = primeiro;
            primeiro = primeiro.direito;
            primeiro.esquerdo = null;
            tam--;
            return noh.valor;
        }
    }

    public int[] toArray() {
        int[] array = new int[tam];
        Noh noh = primeiro;
        for (int i = 0; i < tam; i++) {
            array[i] = noh.valor;
            noh = noh.direito;
        }
        return array;
    }

}
