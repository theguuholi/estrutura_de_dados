package com.example.estruturadedados.aula4;

import org.junit.jupiter.api.Test;

public class HanoiIterativoTests {
    @Test
    void testHanoiIterativo() {
        var hanoi = new HanoiIterativo();
        hanoi.hanoi(1, 'A', 'B', 'C');
    }
}
