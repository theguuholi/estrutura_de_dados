package com.example.estruturadedados.aula6;

import java.util.ArrayList;
import java.util.Random;

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

    public void mergeSort(int[] array) {
        this.array = array;
        mergeSortHelper(this.array, 0, array.length - 1);
    }    

    private void mergeSortHelper(int[] array, int left, int right) {
        if(left < right) {
            int mid = (left + right) / 2;
            mergeSortHelper(array, left, mid);
            mergeSortHelper(array, mid + 1, right);
            merge(array, left, mid, right);
        }
    }

    private void merge(int[] array, int left, int mid, int right) {
        int leftSize = mid - left + 1;
        int rightSize = right - mid;

        int[] leftArray = new int[leftSize];
        int[] rightArray = new int[rightSize];

        for(int i = 0; i < leftSize; i++) {
            leftArray[i] = array[left + i];
        }

        for(int i = 0; i < rightSize; i++) {
            rightArray[i] = array[mid + 1 + i];
        }

        int i = 0, j = 0, k = left;

        while(i < leftSize && j < rightSize) {
            if(leftArray[i] <= rightArray[j]) {
                array[k] = leftArray[i];
                i++;
            } else {
                array[k] = rightArray[j];
                j++;
            }
            k++;
        }

        while(i < leftSize) {
            array[k] = leftArray[i];
            i++;
            k++;
        }

        while(j < rightSize) {
            array[k] = rightArray[j];
            j++;
            k++;
        }
    }

    public int[] quickSort(int[] is) {
      this.array = quickSortHelper(is, 0, is.length - 1);
      return this.array;
    }

    private static int[] quickSortHelper(int[] is, int lowIndex, int highIndex) {
        if(lowIndex >= highIndex) return is;
        int pivotIndex = new Random().nextInt(highIndex - lowIndex + 1) + lowIndex;
        int pivot = is[pivotIndex];
        swap(is, pivotIndex, highIndex);
        int leftPointer = partition(is, lowIndex, highIndex, pivot);
        quickSortHelper(is, lowIndex, leftPointer - 1);
        quickSortHelper(is, leftPointer + 1, highIndex);
        return is;
    }

    private static int partition(int[] is, int lowIndex, int highIndex, int pivot) {
        int leftPointer = lowIndex;
        int rightPointer = highIndex;

        while(leftPointer < rightPointer) {
            while(is[leftPointer] <= pivot && leftPointer < rightPointer) {
                leftPointer++;
            }
            while(is[rightPointer] >= pivot && leftPointer < rightPointer) {
                rightPointer--;
            }
            swap(is, leftPointer, rightPointer);
        }
        swap(is, leftPointer, highIndex);
        return leftPointer;
    }

    private static void swap(int[] is, int index1, int index2) {
        int temp = is[index1];
        is[index1] = is[index2];
        is[index2] = temp;
    }
}
