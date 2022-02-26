//
//  AdjacencyListGraph.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 01.03.2021..
//

import Foundation

// Adjacency List Graph (implemented using HashMap)

public struct Graph<T> where T: CustomStringConvertible & Hashable & Comparable {
    
    // MARK: Enums
    
    public enum GraphEdgeType {
        case unidirectional
        case bidirectional
    }
    
    // MARK: Properties
    
    // Space complexity: O(V + E)
    public private(set) var hashMap: HashMap<Vertex<T>, [Edge<T>]>
    
    public var isEmpty: Bool {
        hashMap.isEmpty
    }
    
    public var count: Int {
        hashMap.elementsCount
    }
    
    // MARK: Graph Methods
    
    /**
       * Will create new Vertex and add it to the Graph
       * Time complexity: O(1)
     */
    public mutating func createVertex(withValue value: T) -> Vertex<T> {
        let vertex = Vertex(index: count, value: value)
        hashMap.add(value: [], forKey: vertex)
        return vertex
    }
    
    /**
       * Will add Unidirectional Edge to the Graph for provided Vertices with provided weight
       * Time complexity: O(1)
     */
    private mutating func addUnidirectionalEdge(fromVertex: Vertex<T>, toVertex: Vertex<T>, withWeight weight: Double?) {
        let edge = Edge(fromVertex: fromVertex, toVertex: toVertex, weight: weight)
        var edges = hashMap.value(forKey: fromVertex)
        edges?.append(edge)
        hashMap.update(key: fromVertex, withNewValue: edges)
    }
    
    /**
       * Will add Bidirectional Edge to the Graph for provided Vertices with provided weight
       * Time complexity: O(1)
     */
    private mutating func addBidirectionalEdge(fromVertex: Vertex<T>, toVertex: Vertex<T>, withWeight weight: Double?) {
        addUnidirectionalEdge(fromVertex: fromVertex, toVertex: toVertex, withWeight: weight)
        addUnidirectionalEdge(fromVertex: toVertex, toVertex: fromVertex, withWeight: weight)
    }
    
    /**
       * Will add Unidirectional or Bidirectional Edge to the Graph for provided Vertices with provided weight
       * Time complexity: O(1)
     */
    public mutating func add(_ edge: GraphEdgeType, fromVertex: Vertex<T>, toVertex: Vertex<T>, withWeight weight: Double?) {
        switch edge {
        case .unidirectional:
            addUnidirectionalEdge(fromVertex: fromVertex, toVertex: toVertex, withWeight: weight)
        case .bidirectional:
            addBidirectionalEdge(fromVertex: fromVertex, toVertex: toVertex, withWeight: weight)
        }
    }
    
    /**
       * Will return all edges between for specific Vertex (if found)
       * Time complexity: O(1)
     */
    public mutating func edges(fromVertex: Vertex<T>) -> [Edge<T>] {
        hashMap.value(forKey: fromVertex) ?? []
    }
    
    /**
       * Will return weight between specific Vertices (if found)
       * Time complexity: O(n)
     */
    public mutating func weight(fromVertex: Vertex<T>, toVertex: Vertex<T>) -> Double? {
        let fetchedEdges = edges(fromVertex: fromVertex)
        return fetchedEdges.first { $0.toVertex == toVertex }?.weight
    }
    
    // MARK: Object's Lifecycle
    
    public init() {
        hashMap = HashMap()
    }
}

// MARK: - Extension: CustomStringConvertible

extension Graph: CustomStringConvertible {
    public var description: String {
        graphRepresentation(elements: hashMap.elements)
    }
    
    /// Note: Tree representation diagram from Data Structures & Algorithms - Ray Wenderlich
    private func graphRepresentation(elements: [Vertex<T>: [Edge<T>]]) -> String {
        var result = ""
        
        for (vertex, edges) in elements {
            var edgeString = ""
            
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.toVertex), ")
                } else {
                    edgeString.append("\(edge.toVertex)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ]\n")
        }

        return result
    }
}
