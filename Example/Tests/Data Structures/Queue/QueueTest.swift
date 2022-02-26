//
//  QueueTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 27.01.2021.
//

import XCTest
@testable import SwiftyDataStructures

class QueueTest: XCTestCase {
    
    var queue = Queue<Int>()
    
    // MARK: - Helper Methods
    
    func fillQueue(withNumberOfValues number: Int) {
        queue = Queue()
        for index in 1...number {
            queue.enqueue(index)
        }
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        queue = Queue()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func testIsEmpty() {
        queue = Queue()
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    // MARK: - Queue Manipulation Methods
    
    func testEnqueue() {
        fillQueue(withNumberOfValues: 1)
        XCTAssertEqual(queue.isEmpty, false)
        queue.enqueue(2)
        XCTAssertEqual(queue.elements.hasMultipleNodes, true)
    }
    
    func testDequeue() {
        fillQueue(withNumberOfValues: 3)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.dequeue(), nil)
    }
    
    func testPeek() {
        fillQueue(withNumberOfValues: 1)
        XCTAssertEqual(queue.peek(), 1)
        
        queue.dequeue()
        XCTAssertEqual(queue.peek(), nil)
    }
    
    func testRemoveAll() {
        fillQueue(withNumberOfValues: 3)
        
        queue.removeAll()
        XCTAssertEqual(queue.isEmpty, true)
    }
 
}
