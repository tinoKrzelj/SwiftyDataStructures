//
//  HashMap.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 28.01.2021.
//

import Foundation

public struct HashMap<Key: Hashable, Value: Any> {
    
    // MARK: - Properties
    
    public private(set) var elements: [Key: Value]
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    public var elementsCount: Int {
        elements.count
    }
    
    // MARK: - Add/Update Methods
    
    /**
       * Add value for key into hash map (if hash map doesn't contain the key already)
       * If HashMap contains the key already then update() in O(1) will be performed
       * Time complexity: O(1)
     */
    public mutating func add(value: Value, forKey key: Key) {
        guard !contains(elementWithKey: key) else {
            update(key: key, withNewValue: value)
            return
        }
        elements[key] = value
    }
        
    /**
       * Update key with new value (if hash map already contains the key) and return true as success
       * If HashMap doesn't contain the key then return false as fail
       * Time complexity: O(1)
     */
    @discardableResult
    public mutating func update(key: Key, withNewValue value: Value?) -> Bool {
        guard let value = value else {
            return false
        }
        
        guard contains(elementWithKey: key) else {
            return false
        }
        elements[key] = value
        return true
    }
    
    // MARK: - Remove Methods
    
    /**
       * Removes all elements of the HashMap
       * Time complexity: O(n)
     */
    public mutating func removeAll() {
        guard !isEmpty else {
            return
        }
        elements.removeAll()
    }
    
    /**
       * Removes value for key (if possible)
       * Time complexity: O(n)
     */
    public mutating func removeValue(forKey key: Key) {
        elements.removeValue(forKey: key)
    }
    
    // MARK: - Search Methods
    
    /**
       * Checks the HashMap for the provided key and returns true if success, otherwise false will be returned
       * Time complexity: O(1)
     */
    public func contains(elementWithKey key: Key) -> Bool {
        elements[key] != nil
    }

    /**
       * For provided key, value will be returned (if found), otherwise return value will be nil
       * Time complexity: O(1)
     */
    public func value(forKey key: Key) -> Value? {
        elements[key]
    }
    
    // MARK: - Object's Lifecycle
    
    public init() {
        elements = [:]
    }
    
    /**
       * Inits HashMap with predefined elements
       * Time complexity: O(1)
     */
    public init(withElements elements: [Key: Value]) {
        self.elements = elements
    }
    
}
