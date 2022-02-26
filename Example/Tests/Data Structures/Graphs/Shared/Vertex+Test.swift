//
//  Vertex+Test.swift
//  TKDataStructuresTests
//
//  Created by Tino Krzelj on 01.03.2021..
//

import XCTest
@testable import SwiftyDataStructures

class Vertex_Test: XCTestCase {

    func testVertex() {
        let vertex = Vertex(index: 1, value: "Test")
        XCTAssertEqual(vertex.value, "Test")
        XCTAssertEqual(vertex.index, 1)
    }
    
}
