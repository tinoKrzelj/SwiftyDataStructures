//
//  Tree.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 02.02.2021.
//

import Foundation

public struct Tree<T> where T: CustomStringConvertible & Equatable {
    
    // MARK: - Properties
    
    public private(set) var root: TreeNode<T>?
    
    public var isEmpty: Bool {
        root == nil
    }
    
    // Traversal Methods
    
    /**
       * Performs tree traversal (based on your selection) and performs provided action on every node
       * Time complexity: O(n)
       * Space complexity: O(n)
     */
    public func performTraversal(method: TreeTraversalMethod,
                                 startingNode: TreeNode<T>? = nil,
                                 actionToPerform: (TreeNode<T>) -> Void) {
        let node = startingNode ?? root
        node?.performTraversal(method: method, actionToPerform: actionToPerform)
    }
    
    // MARK: - Search Methods
    
    /**
      * Performs search for node with provided value by using level order traversal
      * Time complexity: O(n)
     */
    public func searchForNode(withValue value: T) -> TreeNode<T>? {
        root?.searchForNode(withValue: value)
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
       * Inits the tree with provided node as the root node
     */
    public init(withRoot root: TreeNode<T>) {
        self.root = root
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension Tree: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return "\(Tree.self) = \(String.tree.empty)"
        }
        var treeValues = [T]()
        self.performTraversal(method: .levelOrder) { treeValues.append($0.value) }
        var stringValue = "\(Tree.self):\n"
        stringValue.append(treeValues
                            .map { $0.description }
                            .joined(separator: "\n"))
        return stringValue
    }
    
}
