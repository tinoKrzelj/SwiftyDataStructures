//
//  AVLTree.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 09.02.2021..
//

import Foundation

public struct AVLTree<T> where T: Comparable & CustomStringConvertible {
    
    // MARK: - Properties
    
    public private(set) var root: AVLTreeNode<T>?
    
    public var isEmpty: Bool {
        root == nil
    }
    
    // MARK: - Insert Methods
    
    // Public API
    /**
       * Insert node with provided value by following AVL rules
       * Time complexity: O(log n)
     */
    public mutating func insert(_ value: T) {
        root = insert(value, startingNode: root)
    }
    
    // Private
    /**
       * Insert node with provided value by following AVL rules
       * Time complexity: O(log n)
     */
    private func insert(_ value: T, startingNode node: AVLTreeNode<T>?) -> AVLTreeNode<T>? {
        guard let node = node else {
            return AVLTreeNode(value: value)
        }
        if value < node.value {
            node.left = insert(value, startingNode: node.left)
        } else { // value > node.value
            node.right = insert(value, startingNode: node.right)
        }
        let balancedNode = balanced(node)
        balancedNode?.height = max(balancedNode?.leftHeight ?? -1, balancedNode?.rightHeight ?? -1) + 1
        return balancedNode
    }
    
    // MARK: - Rotate & Balance Methods
    
    /**
       * Rotate on provided node (when we have unbalanced children on the right)
       * Time complexity: O(log n)
     */
    private func rotateLeft(_ node: AVLTreeNode<T>) -> AVLTreeNode<T>? {
        let pivot = node.right
        node.right = pivot?.left
        pivot?.left = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot?.height = max(pivot?.leftHeight ?? -1, pivot?.rightHeight ?? -1) + 1
        return pivot
    }
    
    /**
       * Rotate on provided node (when we have unbalanced children on the left)
       * Time complexity: O(log n)
     */
    private func rotateRight(_ node: AVLTreeNode<T>) -> AVLTreeNode<T>? {
        let pivot = node.left
        node.left = pivot?.right
        pivot?.right = node
        node.height = max(node.leftHeight, node.rightHeight) + 1
        pivot?.height = max(pivot?.leftHeight ?? -1, pivot?.rightHeight ?? -1) + 1
        return pivot
    }
    
    /**
       * Rotate on provided node (when we have unbalanced children on the right/left)
       * First it will perform right rotation then left rotation
       * Time complexity: O(log n)
     */
    private func rotateRightLeft(_ node: AVLTreeNode<T>) -> AVLTreeNode<T>? {
        guard let right = node.right else {
            return node
        }
        node.right = rotateRight(right)
        let afterRotationNode = rotateLeft(node)
        return afterRotationNode
    }
    
    /**
       * Rotate on provided node (when we have unbalanced children on the left/right)
       * First it will perform left rotation then right rotation
       * Time complexity: O(log n)
     */
    private func rotateLeftRight(_ node: AVLTreeNode<T>) -> AVLTreeNode<T>? {
        guard let left = node.left else {
            return node
        }
        node.left = rotateLeft(left)
        let afterRotationNode = rotateRight(node)
        return afterRotationNode
    }
    
    /**
       * Based on provided node's balance factor it will perform rotations (if needed)
       * Time complexity: O(log n)
     */
    private func balanced(_ node: AVLTreeNode<T>) -> AVLTreeNode<T>? {
        switch node.balanceFactor {
        case 2: // Use right or left-right rotation
            guard let left = node.left, left.balanceFactor == -1 else {
                return rotateRight(node)
            }
            return rotateLeftRight(node)
        case -2: // Use left or right-left rotation
            guard let right = node.right, right.balanceFactor == 1 else {
                return rotateLeft(node)
            }
            return rotateRightLeft(node)
        default: // Balanced
            return node
        }
    }
    
    // MARK: - Remove Methods
    
    /**
       * Removes all nodes from the AVL Tree
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        root = nil
    }
    
    // Public API
    /**
       * Removes node for provided value (if possible) by following AVL rules
       * Time complexity: O(log n)
     */
    public mutating func remove(_ value: T) {
        root = remove(value, startingNode: root)
    }
    
    // Private API
    /**
       * Removes node for provided value (if possible) by following AVL rules
       * Time complexity: O(log n)
     */
    private func remove(_ value: T, startingNode node: AVLTreeNode<T>?) -> AVLTreeNode<T>? {
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
        let balancedNode = balanced(node)
        balancedNode?.height = max(balancedNode?.leftHeight ?? -1, balancedNode?.rightHeight ?? -1) + 1
        return balancedNode
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        root = nil
    }
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension AVLTree: CustomStringConvertible {
    public var description: String {
        var stringValue = "\(AVLTree.self)"
        stringValue.append("\n\(root?.description ?? String.tree.empty)")
        return stringValue
    }
}
