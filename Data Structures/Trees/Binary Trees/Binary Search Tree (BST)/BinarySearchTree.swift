//
//  BinarySearchTree.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 06.02.2021..
//

import Foundation

public struct BinarySearchTree<T> where T: CustomStringConvertible & Comparable {
    
    // MARK: - Properties
    
    public private(set) var root: BinaryTreeNode<T>?
    
    public var isEmpty: Bool {
        root == nil
    }
    
    // MARK: - Insert Methods
    
    // Public API
    /**
       * Insert node with provided value by following BST rules
       * Time complexity (balanced BST): O(log n)
       * Time complexity (unbalanced BST): O(log n)
     */
    public mutating func insert(_ value: T) {
        root = insert(value, startingNode: root)
    }
    
    // Private
    /**
       * Insert node with provided value by following BST rules
       * Time complexity (balanced BST): O(log n)
       * Time complexity (unbalanced BST): O(log n)
     */
    private func insert(_ value: T, startingNode node: BinaryTreeNode<T>?) -> BinaryTreeNode<T> {
        guard let node = node else {
            return BinaryTreeNode(value: value)
        }
        if value < node.value {
            node.left = insert(value, startingNode: node.left)
        } else { // value > node.value
            node.right = insert(value, startingNode: node.right)
        }
        return node
    }
    
    // MARK: - Search Methods
    
    /**
       * Search for node with provided value and return the node (if found)
       * Time complexity: O(log n)
     */
    public func search(_ value: T) -> BinaryTreeNode<T>? {
        guard !isEmpty else {
            return nil
        }
        var tmpNode = root
        while let node = tmpNode {
            if node.value == value {
                return node
            } else if value < node.value {
                tmpNode = node.left
            } else { // value > node.value
                tmpNode = node.right
            }
        }
        return nil
    }
    
    /**
       * Search for node with provided value and return true (if found)
       * Time complexity: O(log n)
     */
    public func contains(_ value: T) -> Bool {
        search(value) != nil
    }
    
    // MARK: - Remove Methods
    
    /**
       * Removes all nodes from the binary search tree
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        root = nil
    }
    
    // Public API
    /**
       * Removes node for provided value (if possible) by following BST rules
       * Time complexity: O(log n)
     */
    public mutating func remove(_ value: T) {
        root = remove(value, startingNode: root)
    }
    
    // Private API
    /**
       * Removes node for provided value (if possible) by following BST rules
       * Time complexity: O(log n)
     */
    private func remove(_ value: T, startingNode node: BinaryTreeNode<T>?) -> BinaryTreeNode<T>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.left == nil && node.right == nil { // Leaf
                return nil
            } else if node.left == nil { // Node with only one child
                return node.right
            } else if node.right == nil { // Node with only one child
                return node.left
            } else { // Node with two children
                // Force uwnrapp is safe here because we are already assured that node.right is not nil
                node.value = node.right!.min.value
                node.right = remove(node.value, startingNode: node.right)
            }
        } else if value < node.value {
            node.left = remove(value, startingNode: node.left)
        } else { // value > node.value
            node.right = remove(value, startingNode: node.right)
        }
        return node
    }
        
    // MARK: - Init Methods
    
    public init() {
        root = nil
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var stringValue = "\(BinarySearchTree.self)"
        stringValue.append("\n\(root?.description ?? String.tree.empty)")
        return stringValue
    }
}
