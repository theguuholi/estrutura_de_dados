package com.example.estruturadedados.aula6;

public class Ordenacao {

    private int[] array;

    public void selectionSort(int[] array) {
        this.array = array;
        int n = array.length;

        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            
            // Find minimum element in unsorted portion
            for (int j = i + 1; j < n; j++) {
                if (array[j] < array[minIndex]) {
                    minIndex = j;
                }
            }

            // Swap found minimum element with first element of unsorted portion
            if (minIndex != i) {
                int temp = array[i];
                array[i] = array[minIndex];
                array[minIndex] = temp;
            }
        }
    }

    public int[] getArray() {
        return array;
    }

    public void bubbleSort(int[] array) {
        this.array = array; 
        int n = array.length;
        for(int i = 0; i < n - 1; i++) {
            for(int j = 0; j < n - 1 - i; j++) {
                if(array[j] > array[j + 1]) {
                    var temp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = temp;
                }
            }
        }
    }

    public void insertionSort(int[] array) {
        this.array = array;
        int n = array.length;
        for(int i = 1; i < n; i++) {
            int key = array[i];
            int j = i - 1;
            while(j >= 0 && array[j] > key) {
                array[j + 1] = array[j];
                j = j - 1;
            }
            array[j + 1] = key;
        }
    }
    
}
