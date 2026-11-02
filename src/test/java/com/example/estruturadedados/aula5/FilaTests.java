package com.example.estruturadedados.aula5;

import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class FilaTests {
    @Test
    void filaVazia() {
        var fila = new Fila();
        assertTrue(fila.isEmpty());
        assertNull(fila.first());
        assertEquals(0, fila.size());
    }

    @Test
    void enquieOneElement() {
        var fila = new Fila();
        fila.enqueue("A");
        assertFalse(fila.isEmpty());
        assertEquals(1, fila.size());
        assertEquals("A", fila.first());
    }

    @Test 
    void enqueueTwoElements() {
        var fila = new Fila();
        fila.enqueue("A");
        fila.enqueue("B");
        assertFalse(fila.isEmpty());
        assertEquals(2, fila.size());
        assertEquals("A", fila.first());
    }

    @Test 
    void dequeueElements() {
        var fila = new Fila();
        String[] elementos = {"A", "B", "C", "D", "E"};
        for (String elemento : elementos) {
            fila.enqueue(elemento);
        }
        assertFalse(fila.isEmpty());
        assertEquals(5, fila.size());
        assertEquals("A", fila.first());
        assertEquals("A", fila.dequeue());
        assertEquals(4, fila.size());
        assertEquals("B", fila.first());
        assertEquals("B", fila.dequeue());
        assertEquals(3, fila.size());
        assertEquals("C", fila.first());
        assertEquals("C", fila.dequeue());
    }
}
