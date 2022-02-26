//
//  TreeTest.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 02.02.2021..
//

import XCTest
@testable import SwiftyDataStructures

class TreeTest: XCTestCase {

    var tree = Tree<Int>()
    
    // MARK: - Help Methods
    
    func fillTree() {
        tree = Tree(withRoot: TreeNode(value: 1))
        let node2 = TreeNode(value: 2)
        let node3 = TreeNode(value: 3)
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node7 = TreeNode(value: 7)
        
        tree.root?.add(child: node2)
        tree.root?.add(child: node3)
        node2.add(child: node4)
        node2.add(child: node5)
        node3.add(child: node6)
        node3.add(child: node7)
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        tree = Tree<Int>()
        XCTAssertEqual(tree.root, nil)
        
        let rootNode = TreeNode(value: 1)
        tree = Tree<Int>(withRoot: rootNode)
        XCTAssertEqual(tree.root, rootNode)
    }
    
    // MARK: - Properties

    func testIsEmpty() {
        tree = Tree<Int>()
        XCTAssertEqual(tree.isEmpty, true)
        
        fillTree()
        XCTAssertEqual(tree.isEmpty, false)
    }
    
    // MARK: - Traversal Methods
    
    func testTraversalMethods() {
        fillTree()
        
        var testArray1 = [TreeNode<Int>]()
        tree.performTraversal(method: .levelOrder, actionToPerform: { testArray1.append($0) })
        XCTAssertEqual(testArray1[0].value, 1)
        XCTAssertEqual(testArray1[1].value, 2)
        XCTAssertEqual(testArray1[2].value, 3)
        XCTAssertEqual(testArray1[3].value, 4)
        XCTAssertEqual(testArray1[4].value, 5)
        XCTAssertEqual(testArray1[5].value, 6)
        XCTAssertEqual(testArray1[6].value, 7)
        
        var testArray2 = [TreeNode<Int>]()
        tree.performTraversal(method: .depthFirst, actionToPerform: { testArray2.append($0) })
        XCTAssertEqual(testArray2[0].value, 1)
        XCTAssertEqual(testArray2[1].value, 2)
        XCTAssertEqual(testArray2[2].value, 4)
        XCTAssertEqual(testArray2[3].value, 5)
        XCTAssertEqual(testArray2[4].value, 3)
        XCTAssertEqual(testArray2[5].value, 6)
        XCTAssertEqual(testArray2[6].value, 7)
    }
    
    // MARK: - Search Methods
    
    func testSearchMethod() {
        tree = Tree()
        XCTAssertEqual(tree.searchForNode(withValue: 4), nil)
        XCTAssertEqual(tree.searchForNode(withValue: 5), nil)
        
        fillTree()
        XCTAssertEqual(tree.searchForNode(withValue: 4), TreeNode(value: 4))
        XCTAssertEqual(tree.searchForNode(withValue: 5), TreeNode(value: 5))
        XCTAssertEqual(tree.searchForNode(withValue: 2), TreeNode(value: 2, children: [TreeNode(value: 4), TreeNode(value: 5)]))
    }
    
    // MARK: - Remove Methods
    
    func testRemoveAll() {
        fillTree()
        XCTAssertEqual(tree.isEmpty, false)
        
        tree.removeAll()
        XCTAssertEqual(tree.isEmpty, true)
    }

}
