//
//  LinkedListNodeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 24.01.2021.
//

import XCTest
@testable import SwiftyDataStructures

class LinkedListNode_Test: XCTestCase {

    // MARK: - General
    
    func testLinkedListNodeInits() {
        let node2 = LinkedListNode(value: 2, next: nil)
        let node1 = LinkedListNode(value: 1, next: node2)
        
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.next, node2)
        XCTAssertEqual(node2.value, 2)
        XCTAssertEqual(node2.next, nil)
    }
    
}
