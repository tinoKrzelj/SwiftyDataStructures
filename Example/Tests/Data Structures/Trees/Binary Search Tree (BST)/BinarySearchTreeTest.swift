//
//  BinarySearchTreeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 06.02.2021..
//

import XCTest
@testable import SwiftyDataStructures

class BinarySearchTreeTest: XCTestCase {
    
    var binarySearchTree = BinarySearchTree<Int>()
    
    // MARK: - Help Methods
    
    //                  40
    //       18                       77
    //   1       20              70        105
    //      4        25       45        86
    //
    
    func fillBinarySearchTree() {
        binarySearchTree = BinarySearchTree<Int>()
        
        binarySearchTree.insert(40)
        binarySearchTree.insert(77)
        binarySearchTree.insert(18)
        binarySearchTree.insert(20)
        binarySearchTree.insert(1)
        binarySearchTree.insert(105)
        binarySearchTree.insert(70)
        binarySearchTree.insert(25)
        binarySearchTree.insert(4)
        binarySearchTree.insert(88)
        binarySearchTree.insert(45)
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        binarySearchTree = BinarySearchTree()
        XCTAssertEqual(binarySearchTree.root, nil)
        
        binarySearchTree.insert(1)
        XCTAssertEqual(binarySearchTree.root?.value, 1)
    }
    
    // MARK: - Properties

    func testIsEmpty() {
        binarySearchTree = BinarySearchTree<Int>()
        XCTAssertEqual(binarySearchTree.isEmpty, true)
        
        fillBinarySearchTree()
        XCTAssertEqual(binarySearchTree.isEmpty, false)
    }
    
    // MARK: - Insert Methods
    
    func testInsertMethods() {
        binarySearchTree.insert(40)
        XCTAssertEqual(binarySearchTree.isEmpty, false)
        XCTAssertEqual(binarySearchTree.root?.value, 40)
        
        binarySearchTree.insert(77)
        binarySearchTree.insert(18)
        XCTAssertEqual(binarySearchTree.root?.right?.value, 77)
        XCTAssertEqual(binarySearchTree.root?.left?.value, 18)
        
        binarySearchTree.insert(20)
        binarySearchTree.insert(1)
        XCTAssertEqual(binarySearchTree.root?.left?.left?.value, 1)
        XCTAssertEqual(binarySearchTree.root?.left?.right?.value, 20)
        XCTAssertEqual(binarySearchTree.root?.right?.left, nil)
        XCTAssertEqual(binarySearchTree.root?.right?.right, nil)
    }
    
    // MARK: - Search Methods
    
    func testSearchMethod() {
        binarySearchTree = BinarySearchTree()
        XCTAssertEqual(binarySearchTree.search(1), nil)
        
        binarySearchTree.insert(4)
        binarySearchTree.insert(1)
        binarySearchTree.insert(2)
        XCTAssertEqual(binarySearchTree.search(3), nil)
        XCTAssertEqual(binarySearchTree.search(1)?.value, 1)
    }
    
    func testContainsMethod() {
        binarySearchTree = BinarySearchTree()
        XCTAssertEqual(binarySearchTree.contains(1), false)
        
        binarySearchTree.insert(4)
        binarySearchTree.insert(1)
        binarySearchTree.insert(2)
        XCTAssertEqual(binarySearchTree.contains(3), false)
        XCTAssertEqual(binarySearchTree.contains(1), true)
    }
    
    // MARK: - Remove Methods
    
    func testRemoveAllMethods() {
        fillBinarySearchTree()
        XCTAssertEqual(binarySearchTree.isEmpty, false)
        
        binarySearchTree.removeAll()
        XCTAssertEqual(binarySearchTree.isEmpty, true)
    }
    
    func testRemoveMethod() {
        binarySearchTree = BinarySearchTree()
        binarySearchTree.insert(1)
        binarySearchTree.remove(2)
        XCTAssertEqual(binarySearchTree.isEmpty, false)
        XCTAssertEqual(binarySearchTree.root?.value, 1)
        
        binarySearchTree.remove(1)
        XCTAssertEqual(binarySearchTree.isEmpty, true)
    }
    
}
