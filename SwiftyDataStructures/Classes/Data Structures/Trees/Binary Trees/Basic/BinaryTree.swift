//
//  BinaryTree.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 31.01.2021..
//

import Foundation

public struct BinaryTree<T> where T: Comparable & CustomStringConvertible {
    
    // MARK: - Properties
    
    public private(set) var root: BinaryTreeNode<T>?
    
    public var isEmpty: Bool {
        root == nil
    }
    
    // Traversal Methods
    
    /**
       * Performs tree traversal (based on your selection) and performs provided action on every node
       * Time complexity: O(n)
       * Space complexity: O(n)
     */
    public func performTraversal(method: BinaryTreeTraversalMethod,
                                 startingNode: BinaryTreeNode<T>? = nil,
                                 actionToPerform: (BinaryTreeNode<T>) -> Void) {
        let node = startingNode ?? root
        node?.performTraversal(method: method, actionToPerform: actionToPerform)
    }
    
    // MARK: - Remove Methods
    
    /**
       * Removes all nodes from the tree
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        root = nil
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        self.root = nil
    }
    
    /**
       * Inits the binary tree with provided node as the root node
     */
    public init(withRoot root: BinaryTreeNode<T>) {
        self.root = root
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return "\(BinaryTree.self) = \(String.tree.empty)"
        }
        var treeValues = [T]()
        self.performTraversal(method: .levelOrder) { treeValues.append($0.value) }
        var stringValue = "\(BinaryTree.self):\n"
        stringValue.append(treeValues
                            .map { $0.description }
                            .joined(separator: "\n"))
        return stringValue
    }
    
}
