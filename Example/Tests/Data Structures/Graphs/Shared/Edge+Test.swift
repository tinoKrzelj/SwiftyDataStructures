//
//  Edge+Test.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 01.03.2021..
//

import XCTest
@testable import SwiftyDataStructures

class Edge_Test: XCTestCase {
    
    func testEdge() {
        let startVertex = Vertex(index: 0, value: "Start")
        let endVertex = Vertex(index: 1, value: "End")
        let edge = Edge(fromVertex: startVertex, toVertex: endVertex, weight: 100)
        
        XCTAssertEqual(edge.fromVertex, startVertex)
        XCTAssertEqual(edge.toVertex, endVertex)
        XCTAssertEqual(edge.weight, 100)
    }

}
