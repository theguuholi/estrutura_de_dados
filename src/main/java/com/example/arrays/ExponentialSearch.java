package com.example.arrays;

import java.util.Arrays;

public class ExponentialSearch {

    public static int exponentialSearch(int[] arr, int target) {
        if (arr[0] == target) {
            return 0;
        }

        var n = arr.length;
        int i = 1;

        while (i < n && arr[i] <= target) {
            i *= 2;
        }
        if (arr[i] == target) {
            return i;
        }

        return binarySearch(arr, target, i / 2, Math.min(i, n - 1));
    }

    private static int binarySearch(int[] arr, int target, int low, int high) {
        int steps = 0;

        while (low <= high) {
            steps++;
            int mid = low + (high - low) / 2;

            if (arr[mid] == target) {
                System.out.println("Steps taken: " + steps);
                return mid; // Target found
            } else if (arr[mid] < target) {
                low = mid + 1; // Search in the right half
            } else {
                high = mid - 1; // Search in the left half
            }
        }

        return -1;
    }
}
