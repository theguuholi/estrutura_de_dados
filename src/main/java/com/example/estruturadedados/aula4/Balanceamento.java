package com.example.estruturadedados.aula4;

import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class Balanceamento {
    private Deque<Character> deque = new LinkedList<>();
    private Map<Character, Character> map = new HashMap<>();

    public Balanceamento() {
        map.put(')', '(');
        map.put('}', '{');
        map.put(']', '[');
    }

    public boolean isBalanced(String expression) {
        if (expression.isEmpty()) {
            return true;
        }

        for (char c : expression.toCharArray()) {
            if ("({[".contains(String.valueOf(c))) {
                deque.addFirst(c);
            }
            if (")}]".contains(String.valueOf(c))) {
                try {
                    if (deque.peekFirst() == map.get(c)) {
                        deque.removeFirst();
                    } else {
                        return false;
                    }
                } catch (Exception e) {
                    return false;
                }
            }

        }

        return deque.isEmpty();
    }
}
