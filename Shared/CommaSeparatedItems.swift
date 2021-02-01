//
//  CommaSeparatedItems.swift
//  ListRandomizer
//
//  Created by Dan Hart on 2/1/21.
//

import Foundation

class CommaSeparatedItems: RawRepresentable, Identifiable {
    required init?(rawValue: String) {
        if !rawValue.isEmpty {
            values = rawValue.components(separatedBy: ",")
        }
    }
    
    var rawValue: String {
        return values.joined(separator: ",")
    }
    
    typealias RawValue = String
    
    public var values: [String] = []
}
