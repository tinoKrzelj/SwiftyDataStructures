//
//  StackTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 26.01.2021.
//

import XCTest
@testable import SwiftyDataStructures

class StackTest: XCTestCase {
    
    var stack = Stack<Int>()
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        stack = Stack<Int>()
        XCTAssertEqual(stack.elementsCount, 0)
        XCTAssertEqual(stack.isEmpty, true)
        
        stack = Stack<Int>(withElements: [1, 2, 3, 4, 5])
        XCTAssertEqual(stack.elementsCount, 5)
        XCTAssertEqual(stack.isEmpty, false)
        
        stack = Stack<Int>(withElements: 1, 2, 3, 4, 5)
        XCTAssertEqual(stack.elementsCount, 5)
        XCTAssertEqual(stack.isEmpty, false)
        
        let stack2: Stack = [1, 2, 3]
        XCTAssertEqual(stack2.isEmpty, false)
        XCTAssertEqual(stack2.elementsCount, 3)
    }
    
    // MARK: - Helper Methods
    
    func testIsEmpty() {
        stack = Stack<Int>()
        XCTAssertEqual(stack.isEmpty, true)
        
        stack.push(element: 1)
        XCTAssertEqual(stack.isEmpty, false)
    }
    
    func testElementsCount() {
        stack = Stack<Int>()
        XCTAssertEqual(stack.elementsCount, 0)
        
        stack.push(element: 1)
        XCTAssertEqual(stack.elementsCount, 1)
    }
    
    // MARK: - Manipulation Methods
    
    func testPush() {
        stack = Stack<Int>()
        XCTAssertEqual(stack.elementsCount, 0)
        XCTAssertEqual(stack.isEmpty, true)
        
        stack.push(element: 1)
        XCTAssertEqual(stack.elementsCount, 1)
        
        stack.push(element: 2)
        XCTAssertEqual(stack.elementsCount, 2)
    }
    
    func testPop() {
        stack = Stack(withElements: [1, 2, 3])
        XCTAssertEqual(stack.elementsCount, 3)
        
        stack.pop()
        XCTAssertEqual(stack.elementsCount, 2)
        
        stack.pop()
        stack.pop()
        XCTAssertEqual(stack.elementsCount, 0)
        XCTAssertEqual(stack.isEmpty, true)
    }
    
    func testPeek() {
        stack = Stack(withElements: [1, 2, 3])
        XCTAssertEqual(stack.peek(), 3)
        
        stack.pop()
        XCTAssertEqual(stack.peek(), 2)
        
        stack.push(element: 5)
        XCTAssertEqual(stack.peek(), 5)
    }
    
    func testRemoveAll() {
        stack = Stack(withElements: [1, 2, 3])
        XCTAssertEqual(stack.isEmpty, false)
        XCTAssertEqual(stack.elementsCount, 3)
        
        stack.removeAll()
        XCTAssertEqual(stack.isEmpty, true)
        XCTAssertEqual(stack.elementsCount, 0)
    }
    
}
