//
//  AVLTreeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 13.02.2021..
//

import Foundation

import XCTest
@testable import SwiftyDataStructures

class AVLTreeTest: XCTestCase {
    
    var avlTree = AVLTree<Int>()
    
    // MARK: - Helper Methods
    
    // Following AVL rules
    //
    //         10
    //      4      20
    //    3   6
    private func fillAVLTree() {
        avlTree = AVLTree()
        avlTree.insert(10)
        avlTree.insert(4)
        avlTree.insert(20)
        avlTree.insert(3)
        avlTree.insert(6)
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        avlTree = AVLTree()
        XCTAssertEqual(avlTree.root, nil)
    }
    
    // MARK: - Properties
    
    func testIsEmpty() {
        avlTree = AVLTree()
        XCTAssertEqual(avlTree.isEmpty, true)
        
        fillAVLTree()
        XCTAssertEqual(avlTree.isEmpty, false)
    }
    
    // If balance factor is correct that means that leftHegiht and rightHeight are correct too
    func testNodeHeights() {
        fillAVLTree()
        XCTAssertEqual(avlTree.root?.balanceFactor, 1)
        XCTAssertEqual(avlTree.root?.left?.balanceFactor, 0)
        XCTAssertEqual(avlTree.root?.left?.left?.balanceFactor, 0)
        XCTAssertEqual(avlTree.root?.right?.balanceFactor, 0)
    }
    
    // MARK: - Insert Methods
    
    // Info: Private balance and rotation methods will be tested through various insert options
    //       If values are correctly inserted that means that methods from above are working properly
    
    // Insert with left rotation
    func testInsertWithLeftRotationMethod() {
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(29)
        avlTree.insert(28)
        
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 55)
        XCTAssertEqual(avlTree.root?.left?.value, 29)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 28)
        XCTAssertEqual(avlTree.root?.left?.right?.value, 30)
    }
    
    // Insert with right rotation
    func testInsertWithRightRotationMethod() {
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(56)
        avlTree.insert(57)
        
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 56)
        XCTAssertEqual(avlTree.root?.left?.value, 30)
        XCTAssertEqual(avlTree.root?.right?.left?.value, 55)
        XCTAssertEqual(avlTree.root?.right?.right?.value, 57)
    }
    
    // Insert with right-left rotation
    func testInsertWithRightLeftRotationMethod() {
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(27)
        avlTree.insert(28)
        
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 55)
        XCTAssertEqual(avlTree.root?.left?.value, 28)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 27)
        XCTAssertEqual(avlTree.root?.left?.right?.value, 30)
    }
    
    // Insert with left-right rotation
    func testInsertWithLeftRightRotationMethod() {
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(58)
        avlTree.insert(57)
        
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 57)
        XCTAssertEqual(avlTree.root?.left?.value, 30)
        XCTAssertEqual(avlTree.root?.right?.left?.value, 55)
        XCTAssertEqual(avlTree.root?.right?.right?.value, 58)
    }
    
    // MARK: - Remove Methods
    
    func testRemoveAllMethod() {
        fillAVLTree()
        XCTAssertEqual(avlTree.isEmpty, false)
        
        avlTree.removeAll()
        XCTAssertEqual(avlTree.isEmpty, true)
    }
    
    func testRemoveValueMethod() {
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(29)
        avlTree.insert(28)
        
        avlTree.remove(29)
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 55)
        XCTAssertEqual(avlTree.root?.left?.value, 30)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 28)
        XCTAssertEqual(avlTree.root?.left?.right, nil)
        
        avlTree = AVLTree()
        avlTree.insert(40)
        avlTree.insert(30)
        avlTree.insert(55)
        avlTree.insert(29)
        avlTree.insert(28)
        
        avlTree.remove(30)
        XCTAssertEqual(avlTree.root?.value, 40)
        XCTAssertEqual(avlTree.root?.right?.value, 55)
        XCTAssertEqual(avlTree.root?.left?.value, 29)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 28)
        XCTAssertEqual(avlTree.root?.left?.right, nil)
    }
    
}
