//
//  Edge.swift
//  TKDataStructures
//
//  Created by Tino Krzelj on 01.03.2021..
//

import Foundation

public struct Edge<T> where T: CustomStringConvertible & Hashable & Comparable {
  
    // MARK: - Properties
    
    public let fromVertex: Vertex<T>
    public let toVertex: Vertex<T>
    public let weight: Double?
}
