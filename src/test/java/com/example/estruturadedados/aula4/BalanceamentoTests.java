package com.example.estruturadedados.aula4;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

import org.junit.jupiter.api.Test;

public class BalanceamentoTests {
    @Test
    void expressaoVazia() {
        var balanceamento = new Balanceamento();
        assertTrue(balanceamento.isBalanced(""));
    }

    @Test
    void expressaoComParenteses() {
        var balanceamento = new Balanceamento();
        assertTrue(balanceamento.isBalanced("()"));
        assertTrue(balanceamento.isBalanced("{}"));
        assertTrue(balanceamento.isBalanced("[]"));
        assertTrue(balanceamento.isBalanced("({[]})"));
        assertTrue(balanceamento.isBalanced("[({})]"));
        assertTrue(balanceamento.isBalanced("{[()]}"));
    }

    @Test
    void chaveNaoFechada() {
        var balanceamento = new Balanceamento();
        assertFalse(balanceamento.isBalanced("{"));
        assertFalse(balanceamento.isBalanced("["));
        assertFalse(balanceamento.isBalanced("("));
        
    }

    @Test
    void chaveNaoAberta() {
        var balanceamento = new Balanceamento();
        assertFalse(balanceamento.isBalanced("}{"));
        assertFalse(balanceamento.isBalanced("]["));
        assertFalse(balanceamento.isBalanced(")("));
    }

    @Test
    void faltaCaractere() {
        var balanceamento = new Balanceamento();
        assertFalse(balanceamento.isBalanced("({[]}"));
        assertFalse(balanceamento.isBalanced("({]})"));
    }

    @Test 
    void expressaoMatematicaValida() {
        var balanceamento = new Balanceamento();
        assertTrue(balanceamento.isBalanced("({[1+3]*5}/7)+9"));
    }

    @Test
    void charErradoFechando() {
        var balanceamento = new Balanceamento();
        assertFalse(balanceamento.isBalanced("[)"));
    }

}
