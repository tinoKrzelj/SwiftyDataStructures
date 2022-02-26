//
//  BinaryTreeNodeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 31.01.2021..
//
 
import XCTest
@testable import SwiftyDataStructures

class BinaryTreeNodeTest: XCTestCase {
    
    func testInitMethods() {
        let node1 = BinaryTreeNode(value: 1)
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.left, nil)
        XCTAssertEqual(node1.right, nil)
        
        let node2 = BinaryTreeNode(value: 2, left: nil, right: nil)
        XCTAssertEqual(node2.value, 2)
        XCTAssertEqual(node2.left, nil)
        XCTAssertEqual(node2.right, nil)
        
        let node3 = BinaryTreeNode(value: 3, left: node1, right: node2)
        XCTAssertEqual(node3.value, 3)
        XCTAssertEqual(node3.left, node1)
        XCTAssertEqual(node3.right, node2)
    }

    // Following BST rules
    //
    //         10
    //      4      5
    //   2    3
    
    func testMin() {
        let node1 = BinaryTreeNode(value: 10)
        XCTAssertEqual(node1.min.value, 10)
        
        node1.left = BinaryTreeNode(value: 4)
        node1.right = BinaryTreeNode(value: 5)
        XCTAssertEqual(node1.min.value, 4)
        
        node1.left?.right = BinaryTreeNode(value: 3)
        node1.left?.left = BinaryTreeNode(value: 2)
        XCTAssertEqual(node1.min.value, 2)
    }
    
    // Traversal methods will be testet within BinaryTreeTest.swift

}
