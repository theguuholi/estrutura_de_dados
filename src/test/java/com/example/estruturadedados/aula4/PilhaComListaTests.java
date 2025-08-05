package com.example.estruturadedados.aula4;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class PilhaComListaTests {
    @Test
    void createEmptyStack() {
        var pilha = new PilhaComLista();
        assertTrue(pilha.isEmpty());
    }

    @Test
    void enqueueTop() {
        var pilha = new PilhaComLista();
        pilha.enqueue("A");
        assertEquals("A", pilha.top());
    }

    @Test
    void enqueueTwoElements() {
        var pilha = new PilhaComLista();
        pilha.enqueue("A");
        pilha.enqueue("B");
        assertEquals("B", pilha.top());
    }

    @Test
    void dequeue() {
        var pilha = new PilhaComLista();
        pilha.enqueue("A");
        pilha.enqueue("B");
        assertEquals("B", pilha.dequeue());
        assertEquals("A", pilha.dequeue());
    }

}
