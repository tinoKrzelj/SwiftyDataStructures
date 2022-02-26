//
//  HashMapTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 28.01.2021.
//

import XCTest
@testable import SwiftyDataStructures

class HashMapTest: XCTestCase {
    
    var hashMap = HashMap<Int, Int>()
    
    // MARK: - Helper Methods
    
    // For num. of values == 2 it will be [1:1, 2:2, .. etc.]
    func fillHashMap(withNumberOfValues number: Int) {
        hashMap = HashMap<Int, Int>()
        for index in 1...number {
            hashMap.add(value: index, forKey: index)
        }
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        hashMap = HashMap<Int, Int>()
        XCTAssertEqual(hashMap.isEmpty, true)
        
        hashMap = HashMap(withElements: [1: 1])
        XCTAssertEqual(hashMap.isEmpty, false)
    }
    
    func testIsEmpty() {
        hashMap = HashMap<Int, Int>()
        XCTAssertEqual(hashMap.isEmpty, true)
    }
    
    func testElementsCount() {
        hashMap = HashMap<Int, Int>()
        XCTAssertEqual(hashMap.elementsCount, 0)
        
        hashMap = HashMap(withElements: [1: 1])
        XCTAssertEqual(hashMap.elementsCount, 1)
    }
    
    // MARK: - Add/Update Methods

    func testAddAndValueForKeyMethod() {
        fillHashMap(withNumberOfValues: 1)
        XCTAssertEqual(hashMap.elementsCount, 1)
        XCTAssertEqual(hashMap.value(forKey: 1), 1)
        
        hashMap.add(value: 2, forKey: 2)
        XCTAssertEqual(hashMap.elementsCount, 2)
        XCTAssertEqual(hashMap.value(forKey: 2), 2)
    }
    
    func testUpdateMethod() {
        fillHashMap(withNumberOfValues: 2)
        XCTAssertEqual(hashMap.elementsCount, 2)
        XCTAssertEqual(hashMap.value(forKey: 2), 2)
        
        hashMap.update(key: 2, withNewValue: 3)
        XCTAssertEqual(hashMap.elementsCount, 2)
        XCTAssertEqual(hashMap.value(forKey: 2), 3)
    }
    
    // MARK: - Remove Methods

    func testRemoveAll() {
        fillHashMap(withNumberOfValues: 3)
        XCTAssertEqual(hashMap.elementsCount, 3)
        XCTAssertEqual(hashMap.value(forKey: 3), 3)
        
        hashMap.removeAll()
        XCTAssertEqual(hashMap.elementsCount, 0)
        XCTAssertEqual(hashMap.value(forKey: 3), nil)
    }
    
    func testRemoveValueForKey() {
        fillHashMap(withNumberOfValues: 3)
        XCTAssertEqual(hashMap.elementsCount, 3)
        XCTAssertEqual(hashMap.value(forKey: 3), 3)
        
        hashMap.removeValue(forKey: 3)
        XCTAssertEqual(hashMap.elementsCount, 2)
        XCTAssertEqual(hashMap.value(forKey: 3), nil)
    }
    
    
    // MARK: - Search Methods
    
    func testContainsMethod() {
        fillHashMap(withNumberOfValues: 1)
        XCTAssertEqual(hashMap.contains(elementWithKey: 2), false)
        XCTAssertEqual(hashMap.contains(elementWithKey: 1), true)
    }

}
