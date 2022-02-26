//
//  BinaryTreeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 31.01.2021..
//

import XCTest
@testable import SwiftyDataStructures

class BinaryTreeTest: XCTestCase {
    
    var binaryTree = BinaryTree<Int>()
    
    // MARK: - Help Methods
    
    func fillBinaryTree() {
        binaryTree = BinaryTree(withRoot: BinaryTreeNode(value: 1))
        let node2 = BinaryTreeNode(value: 2)
        let node3 = BinaryTreeNode(value: 3)
        let node4 = BinaryTreeNode(value: 4)
        let node5 = BinaryTreeNode(value: 5)
        let node6 = BinaryTreeNode(value: 6)
        let node7 = BinaryTreeNode(value: 7)
        
        binaryTree.root?.left = node2
        binaryTree.root?.right = node3
        node2.left = node4
        node2.right = node5
        node3.left = node6
        node3.right = node7
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        binaryTree = BinaryTree<Int>()
        XCTAssertEqual(binaryTree.root, nil)
        
        let rootNode = BinaryTreeNode(value: 1)
        binaryTree = BinaryTree<Int>(withRoot: rootNode)
        XCTAssertEqual(binaryTree.root, rootNode)
    }
    
    // MARK: - Properties

    func testIsEmpty() {
        binaryTree = BinaryTree<Int>()
        XCTAssertEqual(binaryTree.isEmpty, true)
        
        fillBinaryTree()
        XCTAssertEqual(binaryTree.isEmpty, false)
    }
    
    // MARK: - Traversal Methods
    
    func testTraversalMethods() {
        fillBinaryTree()
        
        var testArray1 = [BinaryTreeNode<Int>]()
        binaryTree.performTraversal(method: .levelOrder, actionToPerform: { testArray1.append($0) })
        XCTAssertEqual(testArray1[0].value, 1)
        XCTAssertEqual(testArray1[1].value, 2)
        XCTAssertEqual(testArray1[2].value, 3)
        XCTAssertEqual(testArray1[3].value, 4)
        XCTAssertEqual(testArray1[4].value, 5)
        XCTAssertEqual(testArray1[5].value, 6)
        XCTAssertEqual(testArray1[6].value, 7)
        
        var testArray2 = [BinaryTreeNode<Int>]()
        binaryTree.performTraversal(method: .preOrder, actionToPerform: { testArray2.append($0) })
        XCTAssertEqual(testArray2[0].value, 1)
        XCTAssertEqual(testArray2[1].value, 2)
        XCTAssertEqual(testArray2[2].value, 4)
        XCTAssertEqual(testArray2[3].value, 5)
        XCTAssertEqual(testArray2[4].value, 3)
        XCTAssertEqual(testArray2[5].value, 6)
        XCTAssertEqual(testArray2[6].value, 7)
        
        var testArray3 = [BinaryTreeNode<Int>]()
        binaryTree.performTraversal(method: .postOrder, actionToPerform: { testArray3.append($0) })
        XCTAssertEqual(testArray3[0].value, 4)
        XCTAssertEqual(testArray3[1].value, 5)
        XCTAssertEqual(testArray3[2].value, 2)
        XCTAssertEqual(testArray3[3].value, 6)
        XCTAssertEqual(testArray3[4].value, 7)
        XCTAssertEqual(testArray3[5].value, 3)
        XCTAssertEqual(testArray3[6].value, 1)
        
        var testArray4 = [BinaryTreeNode<Int>]()
        binaryTree.performTraversal(method: .inOrder, actionToPerform: { testArray4.append($0) })
        XCTAssertEqual(testArray4[0].value, 4)
        XCTAssertEqual(testArray4[1].value, 2)
        XCTAssertEqual(testArray4[2].value, 5)
        XCTAssertEqual(testArray4[3].value, 1)
        XCTAssertEqual(testArray4[4].value, 6)
        XCTAssertEqual(testArray4[5].value, 3)
        XCTAssertEqual(testArray4[6].value, 7)
    }
    
    
    // MARK: - Remove Methods
    
    func testRemoveAll() {
        fillBinaryTree()
        XCTAssertEqual(binaryTree.isEmpty, false)
        
        binaryTree.removeAll()
        XCTAssertEqual(binaryTree.isEmpty, true)
    }
    
}
