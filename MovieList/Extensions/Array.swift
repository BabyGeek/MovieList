//
//  Array.swift
//  MovieList
//
//  Created by Paul Oggero on 28/08/2023.
//

import Foundation

extension Array {
    public func sorted<Value>(
        by keyPath: KeyPath<Self.Element, Value>,
        using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool)
    rethrows -> [Self.Element] {
        return try self.sorted(by: {
            try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
        })
    }
    
    public mutating func sorted<Value: Comparable>(by keyPath: KeyPath<Self.Element, Value>) {
        self = self.sorted(by: keyPath, using: <)
    }
}
