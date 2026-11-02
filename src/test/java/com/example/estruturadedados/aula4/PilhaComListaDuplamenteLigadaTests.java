package com.example.estruturadedados.aula4;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.NoSuchElementException;

import org.junit.jupiter.api.Test;

public class PilhaComListaDuplamenteLigadaTests {

    @Test
    void createEmptyStack() {
        PilhaComListaDuplamenteLigada pilha = new PilhaComListaDuplamenteLigada();
        assertTrue(pilha.isEmpty());
    }

    @Test
    void pushOneElement() {
        var pilha = new PilhaComListaDuplamenteLigada();
        pilha.push("A");
        assertFalse(pilha.isEmpty());
        assertEquals("A", pilha.top());
    }

    @Test
    void topEmptyStack() {
        var pilha = new PilhaComListaDuplamenteLigada();
        assertEquals(null, pilha.top());
    }

    @Test
    void topShouldNotRemoveElement() {
        var pilha = new PilhaComListaDuplamenteLigada();
        pilha.push("A");
        pilha.top();
        assertFalse(pilha.isEmpty());
        assertEquals("A", pilha.top());
    }

    @Test
    void popRemoveElement() {
        var pilha = new PilhaComListaDuplamenteLigada();
        pilha.push("A");
        pilha.push("B");
        pilha.push("C");
        assertFalse(pilha.isEmpty());
        assertEquals("C", pilha.pop());
        assertEquals("B", pilha.pop());
        assertEquals("A", pilha.pop());
    }

    @Test
    void popEmptyStack() {
        var pilha = new PilhaComListaDuplamenteLigada();
        assertThrows(NoSuchElementException.class, () -> pilha.pop());
    }
}
