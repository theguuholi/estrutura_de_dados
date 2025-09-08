package com.example.estruturadedados.aula7;

public class BTree {
    private BNoh root;

    public BNoh getRoot() {
        return root;
    }

    public void insert(int value) {
        var node = new BNoh(value);
        if (root == null) {
            root = node;
        } else {
            BNoh current = root;
            while (true) {
                if (value < current.getValue() && current.getLeft() == null) {
                    current.setLeft(node);
                    break;
                } else if (value > current.getValue() && current.getRight() == null) {
                    current.setRight(node);
                    break;
                } else if (value < current.getValue()) {
                    current = current.getLeft();
                } else {
                    current = current.getRight();
                }
            }
        }
    }

    public boolean lookup(int value) {
        var current = root;

        while (current != null) {
            if (value == current.getValue()) {
                return true;
            } else if (value < current.getValue()) {
                current = current.getLeft();
            } else {
                current = current.getRight();
            }
        }
        return false;
    }

    // public boolean remove(int value) {
    //     var current = root;
    //     if (current == null) {
    //         return false;
    //     }

    //     BNoh parent = null;
        
    //     // Find the node to remove and its parent
    //     while (current != null && current.getValue() != value) {
    //         parent = current;
    //         if (value < current.getValue()) {
    //             current = current.getLeft();
    //         } else {
    //             current = current.getRight(); 
    //         }
    //     }

    //     // Node not found
    //     if (current == null) {
    //         return false;
    //     }

    //     // Case 1: Node has no children
    //     if (current.getLeft() == null && current.getRight() == null) {
    //         if (current == root) {
    //             root = null;
    //         } else if (parent.getLeft() == current) {
    //             parent.setLeft(null);
    //         } else {
    //             parent.setRight(null);
    //         }
    //     }
    //     // Case 2: Node has one child
    //     else if (current.getLeft() == null) {
    //         if (current == root) {
    //             root = current.getRight();
    //         } else if (parent.getLeft() == current) {
    //             parent.setLeft(current.getRight());
    //         } else {
    //             parent.setRight(current.getRight());
    //         }
    //     }
    //     else if (current.getRight() == null) {
    //         if (current == root) {
    //             root = current.getLeft();
    //         } else if (parent.getLeft() == current) {
    //             parent.setLeft(current.getLeft());
    //         } else {
    //             parent.setRight(current.getLeft());
    //         }
    //     }
    //     // Case 3: Node has two children
    //     else {
    //         BNoh successor = current.getRight();
    //         BNoh successorParent = current;
            
    //         // Find the smallest value in the right subtree
    //         while (successor.getLeft() != null) {
    //             successorParent = successor;
    //             successor = successor.getLeft();
    //         }
            
    //         current.setValue(successor.getValue());
            
    //         if (successorParent == current) {
    //             successorParent.setRight(successor.getRight());
    //         } else {
    //             successorParent.setLeft(successor.getRight());
    //         }
    //     }
        
    //     return true;

    // }

}