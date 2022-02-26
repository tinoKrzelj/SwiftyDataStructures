//
//  BinaryTreeNode.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 31.01.2021..
//

import Foundation

public class BinaryTreeNode<T> where T: Comparable & CustomStringConvertible {

    // MARK: - Properties
    
    public var value: T
    public var left: BinaryTreeNode?
    public var right: BinaryTreeNode?
    
    var min: BinaryTreeNode {
        left?.min ?? self
    }
    
    // MARK: - Traversal Methods
    
    /**
       * Performs tree traversal (based on your selection) and performs provided action on every node
       * Time complexity: O(n)
       * Space complexity: O(n)
     */
    func performTraversal(method: BinaryTreeTraversalMethod, actionToPerform: (BinaryTreeNode<T>) -> Void) {
        switch method {
        case .inOrder:
            left?.performTraversal(method: .inOrder, actionToPerform: actionToPerform)
            actionToPerform(self)
            right?.performTraversal(method: .inOrder, actionToPerform: actionToPerform)
        
        case .preOrder:
            actionToPerform(self)
            left?.performTraversal(method: .preOrder, actionToPerform: actionToPerform)
            right?.performTraversal(method: .preOrder, actionToPerform: actionToPerform)
            
        case .postOrder:
            left?.performTraversal(method: .postOrder, actionToPerform: actionToPerform)
            right?.performTraversal(method: .postOrder, actionToPerform: actionToPerform)
            actionToPerform(self)
            
        case .levelOrder:
            actionToPerform(self)
            var queue = Queue<BinaryTreeNode>()
            _ = left.flatMap { queue.enqueue($0) }
            _ = right.flatMap { queue.enqueue($0) }
            
            while let node = queue.dequeue() {
                actionToPerform(node)
                _ = node.left.flatMap { queue.enqueue($0) }
                _ = node.right.flatMap { queue.enqueue($0) }
            }
        }
    }
        
    // MARK: - Object's Lifecycle
    
    public init(value: T, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension BinaryTreeNode: CustomStringConvertible {
    public var description: String {
        treeRepresentation(for: self)
    }
    
    /// Note: Tree representation drawing from Data Structures & Algorithms - Ray Wenderlich
    /// Note: Tree representation drawing implementation by Károly Lőrentey, Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.”
    private func treeRepresentation(for node: BinaryTreeNode<T>?,
                           _ top: String = "",
                           _ root: String = "",
                           _ bottom: String = "") -> String {
        guard let node = node else {
          return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
          return root + "\(node.value)\n"
        }
        return treeRepresentation(for: node.right,
                       top + " ", top + "┌──", top + "│ ")
             + root + "\(node.value)\n"
             + treeRepresentation(for: node.left,
                       bottom + "│ ", bottom + "└──", bottom + " ")
      }
}

//
//  MARK: - Extension - Equatable
//

extension BinaryTreeNode: Comparable {
    public static func < (lhs: BinaryTreeNode<T>, rhs: BinaryTreeNode<T>) -> Bool {
        lhs.value < rhs.value
    }
    
    public static func == (lhs: BinaryTreeNode<T>, rhs: BinaryTreeNode<T>) -> Bool {
        lhs.value == rhs.value &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }
}
