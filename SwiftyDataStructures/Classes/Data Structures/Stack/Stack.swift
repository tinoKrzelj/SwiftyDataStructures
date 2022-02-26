//
//  Stack.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 26.01.2021.
//

import Foundation

public struct Stack<T> {
    
    // MARK: - Properties
    
    public private(set) var elements: Array<T>
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var elementsCount: Int {
        elements.count
    }
    
    // MARK: - Stack Manipulation Methods
    
    /**
       * Push element on top of the stack
       * Time complexity: O(1)
     */
    public mutating func push(element: T) {
        elements.append(element)
    }
    
    /**
       * Pop and return last element of the stack (if possible)
       * Time complexity: O(1)
     */
    @discardableResult
    public mutating func pop() -> T? {
        elements.removeLast()
    }
    
    /**
       * Peek last element of the stack (without removing it)
       * Time complexity: O(1)
     */
    public func peek() -> T? {
        elements.last
    }
    
    /**
       * Remove all elements of the stack
       * Time complexity: O(1)
     */
    public mutating func removeAll() {
        elements = []
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        elements = []
    }
    
    /**
       * Init stack with provided array of elements,  ex. [1, 2, 3, 4, 5]
     */
    public init(withElements elements: [T]) {
        self.elements = elements
    }
    
    /**
       * Init stack with provided elements, ex. 1, 2, 3, 4, 5
     */
    public init(withElements elements: T...) {
        self.elements = elements
    }
}

//
//  MARK: - Extension - ExpressibleByArrayLiteral
//

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self.elements = elements
    }
}

//
//  MARK: - Extension - CustomStringConvertible
//

extension Stack: CustomStringConvertible {
    public var description: String {
        var stackListString = "\(Stack.self):\n"
        stackListString.append(elements
                                .map { "|\($0)|" }
                                .reversed()
                                .joined(separator: "\n"))
        return stackListString
    }
}
