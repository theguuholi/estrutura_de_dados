package com.example.estruturadedados.aula6;

import java.util.HashMap;

public class CalculoTroco {

    public HashMap<Integer, Integer> calcularTroco(int valorCompra, int[] notasDisponiveis) {
        var troco = new HashMap<Integer, Integer>();

        for (int nota : notasDisponiveis) {
            int quantidade = valorCompra / nota;
            valorCompra = valorCompra % nota;
            troco.put(nota, quantidade);
        }

        return troco;
    }

}
