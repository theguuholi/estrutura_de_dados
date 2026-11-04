package com.example.arrays;

public class BinarySearch {
    public static int binarySearch(int[] arr, int target) {
        int low = 0;
        int high = arr.length - 1;
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
