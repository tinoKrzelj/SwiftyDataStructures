//
//  LinkedListTests.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 24.01.2021.
//

import XCTest
@testable import SwiftyDataStructures

class LinkedList_Tests: XCTestCase {

    var linkedList = LinkedList<Int>()

    // MARK: - Help Methods
    
    /// ex. for number = 5, LinkedList will be => 1 -> 2 -> 3 -> 4 -> 5
    func fillLinkedList(withNumberOfValues number: Int) {
        linkedList = LinkedList()
        for index in 1...number {
            linkedList.append(nodeWithValue: index)
        }
    }
    
    // MARK: - Init Methods
    
    func testInitMethods() {
        linkedList = LinkedList()
        XCTAssertEqual(linkedList.isEmpty, true)
        
        linkedList = LinkedList(withNode: LinkedListNode(value: 1))
        XCTAssertEqual(linkedList.isEmpty, false)
        
        linkedList = LinkedList(withNodeValue: 1)
        XCTAssertEqual(linkedList.isEmpty, false)
    }
    
    // MARK: - Append Methods
    
    func testAppendNode() {
        linkedList = LinkedList()
        
        let node1 = LinkedListNode(value: 1)
        linkedList.append(node: node1)
        XCTAssertEqual(linkedList.isEmpty, false)
        XCTAssertEqual(linkedList.head, node1)
        XCTAssertEqual(linkedList.tail, node1)
        
        let node2 = LinkedListNode(value: 2)
        linkedList.append(node: node2)
        XCTAssertEqual(linkedList.head, node1)
        XCTAssertEqual(linkedList.tail, node2)
    }
    
    func testAppendNodeWithValue() {
        linkedList = LinkedList()
        
        linkedList.append(nodeWithValue: 1)
        XCTAssertEqual(linkedList.isEmpty, false)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 1)
        
        linkedList.append(nodeWithValue: 2)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 2)
    }
    
    // MARK: - Insert Methods
    
    func testInsertNodeAtBeginning() {
        linkedList = LinkedList()
        
        let node1 = LinkedListNode(value: 1)
        linkedList.insertAtBeginning(node: node1)
        XCTAssertEqual(linkedList.isEmpty, false)
        XCTAssertEqual(linkedList.head, node1)
        XCTAssertEqual(linkedList.tail, node1)
        
        let node2 = LinkedListNode(value: 2)
        linkedList.insertAtBeginning(node: node2)
        XCTAssertEqual(linkedList.head, node2)
        XCTAssertEqual(linkedList.tail, node1)
    }
    
    func testInsertNodeWithValueAtBeginning() {
        linkedList = LinkedList()
        
        linkedList.insertAtBeginning(nodeWithValue: 1)
        XCTAssertEqual(linkedList.isEmpty, false)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 1)
        
        linkedList.insertAtBeginning(nodeWithValue: 2)
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 1)
    }
    
    func testInsertAfterNode() {
        var linkedList = LinkedList<Int>()
        
        let node1 = LinkedListNode(value: 1)
        let node2 = LinkedListNode(value: 2)
        let node3 = LinkedListNode(value: 3)
        
        linkedList.append(node: node1)
        linkedList.append(node: node2)
        linkedList.append(node: node3)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        let node4 = LinkedListNode(value: 4)
        linkedList.insertNode(node4, afterNode: node3)
        XCTAssertEqual(linkedList.tail?.value, 4)
        
        let node5 = LinkedListNode(value: 5)
        linkedList.insertNode(node5, afterNode: node3)
        XCTAssertEqual(linkedList.tail?.value, 4)
        // 1 -> 2 -> 3 -> (5) -> 4
        XCTAssertEqual(linkedList.node(atIndex: 3)?.value, 5)
        XCTAssertEqual(linkedList.node(atIndex: 3)?.next, linkedList.tail)
    }
    
    // MARK: - Remove Methods
    
    func testRemoveAll() {
        fillLinkedList(withNumberOfValues: 5)
        print(linkedList)
        XCTAssertEqual(linkedList.isEmpty, false)
        linkedList.removeAll()
        XCTAssertEqual(linkedList.isEmpty, true)
    }
    
    func testRemoveFirst() {
        fillLinkedList(withNumberOfValues: 5)
        XCTAssertEqual(linkedList.head?.value, 1)
        linkedList.removeFirst()
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 5)
        
        fillLinkedList(withNumberOfValues: 2)
        XCTAssertEqual(linkedList.head?.value, 1)
        linkedList.removeFirst()
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 2)
        
        fillLinkedList(withNumberOfValues: 1)
        XCTAssertEqual(linkedList.head?.value, 1)
        linkedList.removeFirst()
        XCTAssertEqual(linkedList.head?.value, nil)
        XCTAssertEqual(linkedList.tail?.value, nil)
        
        fillLinkedList(withNumberOfValues: 5)
        XCTAssertEqual(linkedList.head?.value, 1)
        let removedNode = linkedList.removeFirst()
        XCTAssertEqual(removedNode?.value, 1)
        XCTAssertEqual(linkedList.head?.value, 2)
    }
    
    func testRemoveLast() {
        fillLinkedList(withNumberOfValues: 5)
        XCTAssertEqual(linkedList.tail?.value, 5)
        linkedList.removeLast()
        XCTAssertEqual(linkedList.tail?.value, 4)
        
        fillLinkedList(withNumberOfValues: 2)
        XCTAssertEqual(linkedList.tail?.value, 2)
        linkedList.removeLast()
        XCTAssertEqual(linkedList.head?.value, 1)
        
        fillLinkedList(withNumberOfValues: 1)
        XCTAssertEqual(linkedList.head?.value, 1)
        linkedList.removeLast()
        XCTAssertEqual(linkedList.head?.value, nil)
    }
    
    func testRemoveNode() {
        fillLinkedList(withNumberOfValues: 5)
        
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 5)
        
        // When first (1 -> 2 -> 3 -> 4 -> 5 should be 2 -> 3 -> 4 -> 5)
        
        linkedList.removeOccuranceOf(node: LinkedListNode(value: 1))
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 5)
        
        // When last (2 -> 3 -> 4 -> 5 should be 2 -> 3 -> 4)
        
        linkedList.removeOccuranceOf(node: LinkedListNode(value: 5))
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 4)
        
        // When in the middle (2 -> 3 -> 4 should be 2 -> 4)
        
        linkedList.removeOccuranceOf(node: LinkedListNode(value: 3))
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 4)
    }
    
    func testRemoveAfterNode() {
        var linkedList = LinkedList<Int>()
        
        let node1 = LinkedListNode(value: 1)
        let node2 = LinkedListNode(value: 2)
        let node3 = LinkedListNode(value: 3)
        
        linkedList.append(node: node1)
        linkedList.append(node: node2)
        linkedList.append(node: node3)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        linkedList.remove(afterNode: node3)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        linkedList.remove(afterNode: node2)
        XCTAssertEqual(linkedList.tail?.value, 2)
        
        linkedList.append(node: node3)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        linkedList.remove(afterNode: node1)
        XCTAssertEqual(linkedList.tail?.value, 3)
    }
    
    // MARK: - Move Methods
    
    func testMoveMethods() {
        fillLinkedList(withNumberOfValues: 3)
        
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        linkedList.moveNode(from: .first, to: .last)
        XCTAssertEqual(linkedList.head?.value, 2)
        XCTAssertEqual(linkedList.tail?.value, 1)
        XCTAssertEqual(linkedList.tail?.next, nil)
        
        linkedList.moveNode(from: .last, to: .first)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 3)
        XCTAssertEqual(linkedList.tail?.next, nil)
        
        linkedList.moveNode(from: .first, to: .first)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 3)
        
        linkedList.moveNode(from: .last, to: .last)
        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 3)
    }
    
    // MARK: - Peek & Check Methods
    
    func testPeek() {
        fillLinkedList(withNumberOfValues: 3)
        
        XCTAssertEqual(linkedList.peek(atLocation: .first)?.value, 1)
        XCTAssertEqual(linkedList.head?.value, 1)
        
        XCTAssertEqual(linkedList.peek(atLocation: .last)?.value, 3)
        XCTAssertEqual(linkedList.tail?.value, 3)
    }
    
    func testCheck() {
        fillLinkedList(withNumberOfValues: 3)
        guard let node1 = linkedList.head,
              let node2 = linkedList.tail else {
                return
        }
        XCTAssertEqual(linkedList.check(isNode: node1, atLocation: .first), true)
        XCTAssertEqual(linkedList.check(isNode: node2, atLocation: .first), false)
        XCTAssertEqual(linkedList.check(isNode: node1, atLocation: .last), false)
        XCTAssertEqual(linkedList.check(isNode: node2, atLocation: .last), true)
    }
    
    // MARK: - Search Methods
    
    func testNodeAtIndex() {
        fillLinkedList(withNumberOfValues: 1)
        XCTAssertEqual(linkedList.node(atIndex: 0)?.value, 1)
        XCTAssertEqual(linkedList.node(atIndex: 2)?.value, nil)
        
        fillLinkedList(withNumberOfValues: 5)
        XCTAssertEqual(linkedList.node(atIndex: 1)?.value, 2)
        XCTAssertEqual(linkedList.node(atIndex: 4)?.value, 5)
        XCTAssertEqual(linkedList.node(atIndex: 100)?.value, nil)
    }
    
    // MARK: - Properties
    
    func testIsEmpty() {
        linkedList = LinkedList()
        XCTAssertEqual(linkedList.isEmpty, true)
        
        linkedList.append(nodeWithValue: 1)
        XCTAssertEqual(linkedList.isEmpty, false)
    }
    
    func testHasMultipleNodes() {
        linkedList = LinkedList()
        XCTAssertEqual(linkedList.hasMultipleNodes, false)
        
        linkedList.append(nodeWithValue: 1)
        XCTAssertEqual(linkedList.hasMultipleNodes, false)
        
        linkedList.append(nodeWithValue: 2)
        XCTAssertEqual(linkedList.hasMultipleNodes, true)
    }
    
}
