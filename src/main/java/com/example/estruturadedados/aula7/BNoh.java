package com.example.estruturadedados.aula7;

public class BNoh {
    private int value;
    private BNoh right;
    private BNoh left;

    public BNoh(int value) {
            this.left = null;
            this.right = null;
            this.value = value;
    }

    public BNoh getRight() {
        return right;
    }

    public BNoh getLeft() {
        return left;
    }

    public int getValue() {
        return value;
    }

    public void setLeft(BNoh node) {
        this.left = node;
    }

    public void setRight(BNoh node) {
        this.right = node;
    }
}
