//
//  AVLTreeNode.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 09.02.2021..
//

import Foundation

public class AVLTreeNode<T> where T: Comparable & CustomStringConvertible {
    
    // MARK: - Properties
    
    public var value: T
    public var left: AVLTreeNode?
    public var right: AVLTreeNode?
    public var height = 0
    
    var min: AVLTreeNode {
        left?.min ?? self
    }
    
    public var leftHeight: Int {
        left?.height ?? -1
    }
    
    public var rightHeight: Int {
        right?.height ?? -1
    }
    
    public var balanceFactor: Int {
        leftHeight - rightHeight
    }
    
    // MARK: - Object's Lifecycle
    
    public init(value: T, left: AVLTreeNode? = nil, right: AVLTreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension AVLTreeNode: CustomStringConvertible {
    public var description: String {
        treeRepresentation(for: self)
    }
    
    /// Note: Tree representation diagram from Data Structures & Algorithms - Ray Wenderlich
    /// Note: Tree representation diagram implementation by Károly Lőrentey, Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.”
    private func treeRepresentation(for node: AVLTreeNode<T>?,
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

extension AVLTreeNode: Comparable {
    public static func < (lhs: AVLTreeNode<T>, rhs: AVLTreeNode<T>) -> Bool {
        lhs.value < rhs.value
    }
    
    public static func == (lhs: AVLTreeNode<T>, rhs: AVLTreeNode<T>) -> Bool {
        lhs.value == rhs.value &&
        lhs.left == rhs.left &&
        lhs.right == rhs.right
    }
}
