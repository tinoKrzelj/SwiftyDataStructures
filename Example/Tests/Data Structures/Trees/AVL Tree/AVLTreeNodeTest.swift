//
//  AVLTreeNodeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 13.02.2021..
//

import Foundation

import Foundation

import XCTest
@testable import SwiftyDataStructures

class AVLTreeNodeTest: XCTestCase {
            
    // MARK: - Init Methods
    
    func testInitMethods() {
        let node1 = AVLTreeNode(value: 1)
        XCTAssertEqual(node1.value, 1)
        XCTAssertEqual(node1.left, nil)
        XCTAssertEqual(node1.right, nil)
        
        let node2 = AVLTreeNode(value: 2, left: nil, right: nil)
        XCTAssertEqual(node2.value, 2)
        XCTAssertEqual(node2.left, nil)
        XCTAssertEqual(node2.right, nil)
        
        let node3 = AVLTreeNode(value: 3, left: node1, right: node2)
        XCTAssertEqual(node3.value, 3)
        XCTAssertEqual(node3.left, node1)
        XCTAssertEqual(node3.right, node2)
    }
    
    // MARK: - Properties
    
    // Following AVL rules
    //
    //         10
    //      4      20
    //    3   6
    func testMin() {
        let node10 = AVLTreeNode(value: 10)
        let node3 = AVLTreeNode(value: 3)
        let node4 = AVLTreeNode(value: 4)
        let node6 = AVLTreeNode(value: 6)
        let node20 = AVLTreeNode(value: 20)
        
        XCTAssertEqual(node10.min.value, 10)
        
        node10.left = node4
        node10.right = node20
        XCTAssertEqual(node10.min.value, 4)
        
        node4.left = node3
        node4.right = node6
        XCTAssertEqual(node10.min.value, 3)
    }
    
    // Heights and balance factor will be tested within AVLTreeTest
    
}
