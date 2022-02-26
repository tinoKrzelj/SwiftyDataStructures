//
//  Graph+Tets.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 01.03.2021..
//

import XCTest
@testable import SwiftyDataStructures

class Graph_Tets: XCTestCase {
    
    var graph = Graph<String>()
    
    // MARK: - Helper Methods
    
    private func fillGraph() {
        let A = graph.createVertex(withValue: "A")
        let B = graph.createVertex(withValue: "B")
        let C = graph.createVertex(withValue: "C")
        let D = graph.createVertex(withValue: "D")
        let E = graph.createVertex(withValue: "E")
        
        graph.add(.bidirectional, fromVertex: A, toVertex: B, withWeight: 300)
        graph.add(.bidirectional, fromVertex: A, toVertex: C, withWeight: 50)
        graph.add(.bidirectional, fromVertex: C, toVertex: B, withWeight: 25)
        graph.add(.bidirectional, fromVertex: C, toVertex: D, withWeight: 75)
        graph.add(.unidirectional, fromVertex: C, toVertex: E, withWeight: 100)
    }
    
    // MARK: - Add & Create Method
    
    func testAddMethod() {
        graph = Graph()
        
        let A = graph.createVertex(withValue: "A")
        let B = graph.createVertex(withValue: "B")
        let C = graph.createVertex(withValue: "C")
        let D = graph.createVertex(withValue: "D")
        let E = graph.createVertex(withValue: "E")
        
        XCTAssertEqual(A.index, 0)
        XCTAssertEqual(A.value, "A")
        XCTAssertEqual(graph.hashMap.value(forKey: A)?.count, 0)
        
        XCTAssertEqual(B.index, 1)
        XCTAssertEqual(B.value, "B")
        XCTAssertEqual(graph.hashMap.value(forKey: B)?.count, 0)
        
        // If createVertex for tests are passing for A & B  that means createVertex test will pass also for other vertices
        
        graph.add(.bidirectional, fromVertex: A, toVertex: B, withWeight: 300)
        graph.add(.bidirectional, fromVertex: A, toVertex: C, withWeight: 50)
        graph.add(.bidirectional, fromVertex: C, toVertex: B, withWeight: 25)
        graph.add(.bidirectional, fromVertex: C, toVertex: D, withWeight: 75)
        graph.add(.unidirectional, fromVertex: C, toVertex: E, withWeight: 100)
        
        XCTAssertEqual(graph.hashMap.elementsCount, 5)
        XCTAssertEqual(graph.hashMap.value(forKey: A)?.count, 2)
        XCTAssertEqual(graph.hashMap.value(forKey: B)?.count, 2)
        XCTAssertEqual(graph.hashMap.value(forKey: C)?.count, 4)
        XCTAssertEqual(graph.hashMap.value(forKey: D)?.count, 1)
        XCTAssertEqual(graph.hashMap.value(forKey: E)?.count, 0)
    }
    
    func testEdgesMethod() {
        graph = Graph()
        
        let A = graph.createVertex(withValue: "A")
        let B = graph.createVertex(withValue: "B")
        let C = graph.createVertex(withValue: "C")
        let D = graph.createVertex(withValue: "D")
        let E = graph.createVertex(withValue: "E")
        
        graph.add(.bidirectional, fromVertex: A, toVertex: B, withWeight: 300)
        graph.add(.bidirectional, fromVertex: A, toVertex: C, withWeight: 50)
        graph.add(.bidirectional, fromVertex: C, toVertex: B, withWeight: 25)
        graph.add(.bidirectional, fromVertex: C, toVertex: D, withWeight: 75)
        graph.add(.unidirectional, fromVertex: C, toVertex: E, withWeight: 100)
        
        XCTAssertEqual(graph.edges(fromVertex: A).count, 2)
        XCTAssertEqual(graph.edges(fromVertex: B).count, 2)
        XCTAssertEqual(graph.edges(fromVertex: C).count, 4)
        XCTAssertEqual(graph.edges(fromVertex: D).count, 1)
        XCTAssertEqual(graph.edges(fromVertex: E).count, 0)
    }
    
    func testWeightMethod() {
        graph = Graph()
        
        let A = graph.createVertex(withValue: "A")
        let B = graph.createVertex(withValue: "B")
        let C = graph.createVertex(withValue: "C")
        let D = graph.createVertex(withValue: "D")
        let E = graph.createVertex(withValue: "E")
        
        graph.add(.bidirectional, fromVertex: A, toVertex: B, withWeight: 300)
        graph.add(.bidirectional, fromVertex: A, toVertex: C, withWeight: 50)
        graph.add(.bidirectional, fromVertex: C, toVertex: B, withWeight: 25)
        graph.add(.bidirectional, fromVertex: C, toVertex: D, withWeight: 75)
        graph.add(.unidirectional, fromVertex: C, toVertex: E, withWeight: 100)
        
        XCTAssertEqual(graph.weight(fromVertex: A, toVertex: B), 300)
        XCTAssertEqual(graph.weight(fromVertex: A, toVertex: C), 50)
        XCTAssertEqual(graph.weight(fromVertex: C, toVertex: B), 25)
        XCTAssertEqual(graph.weight(fromVertex: C, toVertex: D), 75)
        XCTAssertEqual(graph.weight(fromVertex: C, toVertex: E), 100)
        
        // Bidirectional edge test ex. A <-> C
        // If test pass that means it will pass for other bidirectional edges as well
        
        XCTAssertEqual(graph.weight(fromVertex: A, toVertex: C), 50)
        XCTAssertEqual(graph.weight(fromVertex: C, toVertex: A), 50)
    }
    
    // MARK: - Properties
    
    func testIsEmpty() {
        graph = Graph()
        XCTAssertEqual(graph.isEmpty, true)
    }
    
    func testCount() {
        graph = Graph()
        XCTAssertEqual(graph.count, 0)
        
        fillGraph()
        XCTAssertEqual(graph.count, 5)
    }

    // MARK: - Object's Lifecycle
    
    func testInit() {
        graph = Graph()
        XCTAssertEqual(graph.hashMap.isEmpty, true)
    }
}
 
