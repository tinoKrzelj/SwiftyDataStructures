//
//  LinkedListNode.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 23.01.2021.
//

import Foundation

public class LinkedListNode<T> where T: CustomStringConvertible {
    
    // MARK: - Properties
    
    public var value: T
    public var next: LinkedListNode?
    
    // MARK: - Object's Lifecycle
    
    public init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    public init(value: T) {
        self.value = value
        self.next = nil
    }
}

//  MARK: - Extension - CustomStringConvertible

extension LinkedListNode: CustomStringConvertible {
    public var description: String {
        value.description
    }
}

//  MARK: - Extension - Equatable

extension LinkedListNode: Equatable {
    public static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        lhs.value.description == rhs.value.description
    }
}
