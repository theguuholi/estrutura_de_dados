package com.example.arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class ExponentialSearthTests {

    @Test
    void testMaximumLengthSubstring() {
        int[] arr = {
                1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                31, 32, 33, 34, 35, 36, 37, 38, 39, 40
        };

        var target = 32;
        var result = ExponentialSearch.exponentialSearch(arr, target);
        assertEquals(31, result); // The index of target 32 in the array is 31

    }

}
