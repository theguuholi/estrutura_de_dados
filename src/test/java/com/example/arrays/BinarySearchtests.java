package com.example.arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class BinarySearchtests {
    
    @Test 
    void testBinarySearch() {
        int[] arr = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        int target = 3;
        int result = BinarySearch.binarySearch(arr, target);
        assertEquals(2, result); // The index of target 3 in the array is 2
    }
}
