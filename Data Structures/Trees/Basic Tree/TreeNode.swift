//
//  TreeNode.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 02.02.2021..
//

import Foundation

public class TreeNode<T> where T: Equatable & CustomStringConvertible {

    // MARK: - Properties
    
    public var value: T
    public lazy var children = [TreeNode]()
    
    /**
       * Performs tree traversal (based on your selection) and performs provided action on every node
       * Time complexity: O(n)
       * Space complexity: O(n)
     */
    func performTraversal(method: TreeTraversalMethod, actionToPerform: (TreeNode<T>) -> Void) {
        switch method {
        case .depthFirst:
            actionToPerform(self)
            children.forEach {
                $0.performTraversal(method: .depthFirst, actionToPerform: actionToPerform)
            }
        
        case .levelOrder:
            actionToPerform(self)
            var queue = Queue<TreeNode>()
            children.forEach { queue.enqueue($0) }
            
            while let node = queue.dequeue() {
                actionToPerform(node)
                node.children.forEach { queue.enqueue($0) }
            }
        }
    }
    
    // MARK: - Insertion Methods
    
    /**
      * Appends child node at the end
      * Time complexity: O(1)
     */
    public func add(child: TreeNode) {
        children.append(child)
    }
    
    // MARK: - Search Methods
    
    /**
      * Performs search for node with provided value by using level order traversal
      * Time complexity: O(n)
     */
    func searchForNode(withValue value: T) -> TreeNode? {
        guard self.value != value else {
            return self
        }
        guard !children.isEmpty else {
            return nil
        }
        var searchNode: TreeNode?
        performTraversal(method: .levelOrder) { node in
            if node.value == value {
                searchNode = node
            }
        }
        return searchNode
    }
        
    // MARK: - Object's Lifecycle
    
    public init(value: T, children: [TreeNode]? = nil) {
        self.value = value
        self.children = children ?? []
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension TreeNode: CustomStringConvertible {
    public var description: String {
        value.description
    }
}

//
//  MARK: - Extension - Equatable
//

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.value == rhs.value &&
        lhs.children == rhs.children
    }
}

