package com.example.estruturadedados.aula4;

import java.util.Deque;
import java.util.LinkedList;

public class PilhaComListaDuplamenteLigada {

    private Deque<Object> deque = new LinkedList<>();
    public boolean isEmpty() {
        return this.deque.isEmpty();
    }

    public void push(Object obj) {
        this.deque.addFirst(obj);
    }

    public Object top() {
        return this.deque.peekFirst();
    }

    public Object pop() {
        return this.deque.pop();
    }
    
}
