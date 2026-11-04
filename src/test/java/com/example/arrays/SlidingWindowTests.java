package com.example.arrays;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class SlidingWindowTests {
    
    @Test 
    void maximumLengthSubstring() {
        // Test case for maximum length substring with at most k distinct characters
        String s = "bcbbbcba";
        int result = new SlidingWindow().maximumLengthSubstring(s);
        assertEquals(4, result); // Expected output is 4 for substring "bcbbb"
    }
}
