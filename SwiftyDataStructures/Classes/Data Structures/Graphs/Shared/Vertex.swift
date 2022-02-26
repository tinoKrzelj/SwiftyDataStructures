//
//  Vertex.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 01.03.2021..
//

import Foundation

public struct Vertex<T> where T: CustomStringConvertible & Hashable & Comparable {
    
    // MARK: - Properties
    
    public let index: Int
    public let value: T
}

// MARK: - Extension Hashable

// Compiler synthesized conformance
extension Vertex: Hashable where T: Hashable {}

// MARK: - Extension Comparable

extension Vertex: Comparable where T: Comparable {
    public static func < (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.value < rhs.value && lhs.index == rhs.index
    }
}

// MARK: - Extension CustomStringConvertible

extension Vertex: CustomStringConvertible {
    public var description: String {
        "\(index): \(value)"
    }
}
