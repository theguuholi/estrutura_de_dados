package com.example.estruturadedados.aula4;

import java.util.LinkedList;

public class PilhaComLista {
    private LinkedList<Object> lista = new LinkedList<>();

    public boolean isEmpty() {
        return this.lista.isEmpty();
    }

    public void enqueue(Object obj) {
        this.lista.addFirst(obj);
    }

    public Object top() {
        return this.lista.peekFirst();
    }

    public Object dequeue() {
        return this.lista.removeFirst();
    }
}
