//
//  Logger.swift
//  TKDataStructures
//
//  Created by Tino Krželj on 23/01/2021.
//  Copyright © 2021 Tino Krželj. All rights reserved.
//

import Foundation

struct Logger {
    
    /// Logs simple message only if in DEBUG mode
    static func log(message: String) {
        #if DEBUG
            print(message)
        #endif
    }
    
    /// Logs message with tag only if in DEBUG mode
    static func log(message: String, withTag tag: String) {
        #if DEBUG
            print("\(tag) => \(message)")
        #endif
    }
}
