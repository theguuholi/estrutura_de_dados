package com.example.estruturadedados.aula4;

import java.util.Deque;
import java.util.LinkedList;

public class HanoiIterativo {
    private Deque<Character> deque = new LinkedList<>();

    public void hanoi(int n) {
        var origem = 'A';
        var destino = 'B';
        System.out.println(origem + " -> " + destino + " : " + n);
        
    }
}
