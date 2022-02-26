//
//  LinkedList.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 23.01.2021.
//

import Foundation

public struct LinkedList<T> where T: CustomStringConvertible {
    
    // MARK: - Enums
    
    public enum LinkedListNodeLocation {
        case first, last
    }
    
    // MARK: - Properties
    
    public var head: LinkedListNode<T>?
    public var tail: LinkedListNode<T>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var hasMultipleNodes: Bool {
        !isEmpty && head != tail
    }
    
    // MARK: - Search Methods
    
    /**
       * Return node for provided index (if possible)
       * Time complexity: O(n) where n == index
     */
    public func node(atIndex index: UInt) -> LinkedListNode<T>? {
        guard !isEmpty else {
            return nil
        }
        var i = 0
        var tmp = head
        while tmp != nil && i <= index {
            if i == index {
                return tmp
            } else {
                tmp = tmp?.next
                i += 1
            }
        }
        return nil
    }
        
    // MARK: - Insert/Append/Move Methods
    
    /**
       * Append provided node at the end of the LinkedList
       * Time complexity: O(1)
     */
    public mutating func append(node: LinkedListNode<T>) {
        guard !isEmpty else {
            insertAtBeginning(node: node)
            return
        }
        node.next = nil
        tail?.next = node
        tail = node
    }
    
    /**
       * Append new node created with the provided value at the end of the LinkedList
       * Time complexity: O(1)
     */
    public mutating func append(nodeWithValue value: T) {
        append(node: LinkedListNode(value: value))
    }
    
    /**
       * Insert new node created with the provided value at the beginning of the LinkedList
       * Time complexity: O(1)
     */
    public mutating func insertAtBeginning(node: LinkedListNode<T>) {
        guard !isEmpty else {
            head = node
            head?.next = nil
            tail = head
            return
        }
        node.next = head
        head = node
    }
        
    /**
       * Insert new node created with the provided value at the beginning of the LinkedList
       * Time complexity: O(1)
     */
    public mutating func insertAtBeginning(nodeWithValue value: T) {
        insertAtBeginning(node: LinkedListNode(value: value))
    }
    
    /**
       * Insert provided node after the provided one (if possible)
       * Time complexity: O(1)
     */
    public mutating func insertNode(_ insertNode: LinkedListNode<T>, afterNode: LinkedListNode<T>) {
        guard !isEmpty else {
            return
        }
        guard afterNode != tail else {
            append(node: insertNode)
            return
        }
        insertNode.next = afterNode.next
        afterNode.next = insertNode
    }
    
    /**
       * Move first element at the end or last element at the beginning
       * Time complexity (.first -> .last): O(1)
       * Time complexity (.last -> .first): O(n)
     */
    public mutating func moveNode(from locationFrom: LinkedListNodeLocation, to locationTo: LinkedListNodeLocation) {
        guard locationTo != locationFrom && hasMultipleNodes, let oldHead = head, let oldLastNode = tail else {
            return
        }
        if locationFrom == .first {
            head = head?.next
            append(node: oldHead)
        } else {
            removeLast()
            insertAtBeginning(node: oldLastNode)
        }
    }
    
    // MARK: - Remove/Delete Methods
    
    /**
       * Removes all nodes of the LinkedList
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        head = nil
        tail = nil
    }
    
    /**
       * Removes first node of the LinkedList
       * Time complexity: O(1)
     */
    @discardableResult
    public mutating func removeFirst() -> LinkedListNode<T>? {
        guard !isEmpty else {
            return nil
        }
        guard hasMultipleNodes else {
            let removedNode = head
            removeAll()
            return removedNode
        }
        let removedNode = head
        let newHead = head?.next
        newHead?.next = head?.next?.next
        head = newHead
        return removedNode
    }
    
    /**
       * Removes last node of the LinkedList
       * Time complexity: O(n)
     */
    public mutating func removeLast() {
        guard !isEmpty else {
            return
        }
        guard hasMultipleNodes else {
            removeAll()
            return
        }
        var tmp = head
        while tmp != nil {
            if tmp?.next?.next == nil {
                tmp?.next = nil
                tail = tmp
                break
            } else {
                tmp = tmp?.next
            }
        }
    }
    
    /**
       * Removes provided node (if found) of the LinkedList
       * Time complexity: O(n)
     */
    public mutating func removeOccuranceOf(node: LinkedListNode<T>) {
        guard !isEmpty else {
            return
        }
        guard !check(isNode: node, atLocation: .first) else {
            removeFirst()
            return
        }
        guard !check(isNode: node, atLocation: .last) else {
            removeLast()
            return
        }
        var tmp = head
        while tmp != nil {
            if tmp?.next == node {
                tmp?.next = tmp?.next?.next
                break
            } else {
                tmp = tmp?.next
            }
        }
    }
    
    /**
       * Removes next node of the provided one (if possible)
       * Time complexity: O(1)
     */
    public mutating func remove(afterNode node: LinkedListNode<T>) {
        guard !isEmpty else {
            return
        }
        guard node != tail else {
            return
        }
        guard node.next != tail else {
            node.next = node.next?.next
            tail = node
            return
        }
        node.next = node.next?.next
    }
    
    // MARK: - Peek Methods
    
    /**
       * Return first or last node based on location (without removing it)
       * Time complexity: O(1)
     */
    public func peek(atLocation location: LinkedListNodeLocation) -> LinkedListNode<T>? {
        guard !isEmpty else {
            return nil
        }
        return location == .first ? head : tail
    }
    
    /**
       * Return is provided node first or last in the LinkedList based on the provided location
       * Time complexity: O(1)
     */
    public func check(isNode node: LinkedListNode<T>, atLocation location: LinkedListNodeLocation) -> Bool {
        location == .first ? node == head : node == tail
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        removeAll()
    }
    
    /**
       * Init LinkedList with provided node as a head node
     */
    public init(withNode node: LinkedListNode<T>) {
        head = node
        tail = head
    }
    
    /**
       * Init LinkedList with new node created with provided value as a head node
     */
    public init(withNodeValue value: T) {
        head = LinkedListNode(value: value)
        tail = head
    }
    
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard !isEmpty else {
            return String.linkedList.linkedListEmpty
        }
        var linkedListString = "\(LinkedList.self) => "
        var tmp = head
        while tmp != nil {
            linkedListString.append("\(tmp?.description ?? String.linkedList.errorNodeValue) ")
            tmp = tmp?.next
        }
        return linkedListString
    }
}
