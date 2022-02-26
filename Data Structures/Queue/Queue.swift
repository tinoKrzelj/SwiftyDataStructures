//
//  Queue.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 27.01.2021.
//

import Foundation

public struct Queue<T> where T: CustomStringConvertible {
    
    // MARK: - Properties
    
    public private(set) var elements: LinkedList<T>
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    // MARK: - Queue Manipulation Methods
    
    /**
       * Enqueue element into the queue (return true if successful)
       * Time complexity: O(1)
     */
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        elements.append(nodeWithValue: element)
        return true
    }
    
    /**
       * Dequeue first element out of the Queue (if possible) and return it
       * Time complexity: O(1)
     */
    @discardableResult
    public mutating func dequeue() -> T? {
        elements.removeFirst()?.value
    }
    
    /**
       * Peek first element of the Queue (without removing it) if possible
       * Time complexity: O(1)
     */
    public func peek() -> T? {
        elements.peek(atLocation: .first)?.value
    }
    
    /**
       * Removes all elements out of the Queue
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        elements.removeAll()
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        elements = LinkedList()
    }
  
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension Queue: CustomStringConvertible {
    public var description: String {
        var printString = String.queue.printPlaceholder
        printString = printString.replacingOccurrences(of: "%@1", with: "\(Queue.self)")
        printString = printString.replacingOccurrences(of: "%@2", with: elements.description)
        return printString
    }
    
}
