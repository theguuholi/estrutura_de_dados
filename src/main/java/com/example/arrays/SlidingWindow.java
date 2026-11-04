package com.example.arrays;

import java.util.HashMap;

public class SlidingWindow {

    public int maximumLengthSubstring(String s) {
        int left = 0, right = 0;
        int max = 1;
        HashMap<Character, Integer> counter = new HashMap<>();
        counter.put(s.charAt(0), 1);

        while (right < s.length() - 1) {
            right++;
            var charAt = s.charAt(right);
            if (counter.containsKey(charAt)) {
                var v = counter.get(charAt);
                counter.put(charAt, v + 1);
            } else {
                counter.put(charAt, 1);
            }
            while (counter.get(charAt) == 3) {
                counter.put(s.charAt(left), counter.get(s.charAt(left)) - 1);
                left++;
            }
            max = Math.max(max, right - left + 1);
        }
        return max;
    }

}
