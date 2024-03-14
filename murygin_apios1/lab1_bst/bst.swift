//
//  node.swift
//  murygin_apios1
//
//  Created by Kacper Murygin on 14/03/2024.
//

import Foundation

        
class BST {
    class Node {
        var id: String
        var key: Int
        var data: Any
        var greater: Node?
        var smallerAndEqual: Node?
        weak var parent: Node?

        init (key: Int, data: Any) {
            self.id = UUID().uuidString
            self.key = key
            self.data = data
            self.greater = nil
            self.smallerAndEqual = nil
            print("Node with id", self.id, "has been born")
        }
        
        deinit {
            print("Node with id", self.id, "has been killed")
        }
    }
    var root: Node?
    var id: String
    
    init() {
        self.id = UUID().uuidString
        print("BST with id", self.id, "has been born")
    }
    
    deinit {
        print("BST with id", self.id, "has been killed")
    }
    
    func insert(key: Int, data: Any) {
        if (self.root == nil) {
            self.root = Node(key: key, data: data)
        }
        else {
            self.recursiveInsert(node: self.root!, key: key, data: data)
        }
    }
    
    func recursiveInsert(node: Node, key: Int, data: Any) {
        if (key < node.key) {
            if (node.smallerAndEqual != nil) {
                self.recursiveInsert(node: node.smallerAndEqual!, key: key, data: data)
            }
            else {
                node.smallerAndEqual = Node(key: key, data: data)
                node.smallerAndEqual!.parent = node
            }
        }
        else {
            if (node.greater != nil) {
                self.recursiveInsert(node: node.greater!, key: key, data: data)
            }
            else {
                node.greater = Node(key: key, data: data)
                node.greater!.parent = node
            }
        }
    }
    
    func printBst() {
        func inorder(node: Node?) {
            if (node != nil) {
                inorder(node: node!.smallerAndEqual)
                if (node!.parent != nil) {
                    print(node!.data, node!.key, "its parent: ", node!.parent!.data)
                }
                else {
                    print(node!.data, node!.key, "its parent: ", "none")
                }
                inorder(node: node!.greater)
            }
        }
        inorder(node: self.root)
    }
}
