//
//  TreeNodeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 02.02.2021..
//

import XCTest
@testable import SwiftyDataStructures

class TreeNodeTest: XCTestCase {

    func testInitMethods() {
        let node1 = TreeNode(value: 1, children: [])
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.children.isEmpty, true)
        
        let node2 = TreeNode(value: 2, children: [])
        XCTAssertEqual(node2.value, 2)
        XCTAssertEqual(node2.children.isEmpty, true)
        
        let node3 = TreeNode(value: 3, children: [node1, node2])
        XCTAssertEqual(node3.value, 3)
        XCTAssertEqual(node3.children.count, 2)
        XCTAssertEqual(node3.children.first?.value, 1)
        XCTAssertEqual(node3.children.last?.value, 2)
    }
    
    func testAddChildMethod() {
        let node1 = TreeNode(value: 1, children: [])
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.children.isEmpty, true)
        
        let node2 = TreeNode(value: 2, children: [])
        node1.add(child: node2)
        XCTAssertEqual(node1.children.isEmpty, false)
        XCTAssertEqual(node1.children.count, 1)
        
        let node3 = TreeNode(value: 3, children: [])
        node1.add(child: node3)
        XCTAssertEqual(node1.children.count, 2)
        XCTAssertEqual(node1.children.first?.value, 2)
        XCTAssertEqual(node1.children.last?.value, 3)
    }
    
    // Traversal and search methods will be testet within BinaryTreeTest.swift

}
