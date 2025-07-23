package com.example.estruturadedados.aula3.ListaSimples;

public class ListaSimples {
    private Noh head;
    private int size;

    public ListaSimples() {
        this.head = null;
        this.size = 0;
    }

    public int size() {
        return size;
    }

    public Noh getHead() {
        return head;
    }

    public void add(Object valor) {
        Noh novoNoh = new Noh(valor);
        if (head == null) {
            head = novoNoh;
        } else {
            Noh atual = head;
            while (atual.getProximo() != null) {
                atual = atual.getProximo();
            }
            atual.setProximo(novoNoh);
        }
        size++;
    }

    public void add(Object valor, int index) {
        Noh novoNoh = new Noh(valor);
        if (index == 0) {
            novoNoh.setProximo(head);
            head = novoNoh;
        } else {
            Noh atual = head;
            for (int i = 0; i < index - 1; i++) {
                atual = atual.getProximo();
            }
            novoNoh.setProximo(atual.getProximo());
            atual.setProximo(novoNoh);
        }
        size++;
    }

    public Object getItem(int i) {
        Noh atual = head;
        for (int j = 0; j < i; j++) {
            atual = atual.getProximo();
        }
        return atual.getValor();
    }

    public void remove(Object item) {
        Noh atual = head;
        while(atual != null) {
            if(atual.getValor() == item) {
                atual.setProximo(atual.getProximo());
                size--;
                return;
            }
            atual = atual.getProximo();
        }
    }
}
