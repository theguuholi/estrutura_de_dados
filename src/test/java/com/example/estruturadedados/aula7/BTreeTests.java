package com.example.estruturadedados.aula7;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class BTreeTests {
    @Test
    public void testInit() {
        var tree = new BTree();
        
        tree.insert(9);
        assertEquals(9, tree.getRoot().getValue());
        
        tree.insert(4);
        assertEquals(4, tree.getRoot().getLeft().getValue());

        tree.insert(20);
        assertEquals(20, tree.getRoot().getRight().getValue());

        tree.insert(1);
        assertEquals(1, tree.getRoot().getLeft().getLeft().getValue());


        tree.insert(6);
        assertEquals(6, tree.getRoot().getLeft().getRight().getValue());

        tree.insert(15);
        assertEquals(15, tree.getRoot().getRight().getLeft().getValue());
        
        tree.insert(170);
        assertEquals(170, tree.getRoot().getRight().getRight().getValue());
    }

    @Test
    public void testSearch() {
        var tree = new BTree();
        tree.insert(9);        
        tree.insert(4);
        tree.insert(20);
        tree.insert(1);
        tree.insert(6);
        tree.insert(15);
        tree.insert(170);

        assertEquals(true, tree.lookup(170));
        assertEquals(false, tree.lookup(171));
    }

    // @Test
    // public void remove() {
    //     var tree = new BTree();
    //     tree.insert(9);        
    //     tree.insert(4);
    //     tree.insert(20);
    //     tree.insert(1);
    //     tree.insert(6);
    //     tree.insert(15);
    //     tree.insert(170);

    //     assertEquals(true, tree.remove(170));
    //     assertEquals(false, tree.remove(171));
    // }
}
