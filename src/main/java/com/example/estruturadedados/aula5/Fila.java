package com.example.estruturadedados.aula5;

import java.util.Deque;
import java.util.LinkedList;

public class Fila {
    private Deque<Object> deque = new LinkedList<>();

    public boolean isEmpty() {
        return this.deque.isEmpty();
    }

    public int size() {
        return this.deque.size();
    }

    public Object first() {
        return this.deque.peekFirst();
    }

    public void enqueue(Object object) {
        this.deque.addLast(object);
    }

    public Object dequeue() {
        return this.deque.removeFirst();
    }
    
}
