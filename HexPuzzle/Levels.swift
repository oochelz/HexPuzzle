//
//  Levels.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import Foundation

struct Levels {
    static var patterns = [
        // Level 1
        [
            ["Purple", "Purple"],
            ["Green", "Green", "Green"],
            ["Green", "Green"]
        ],
        // Level 2
        [
            ["Purple", "Green"],
            ["Purple", "Blue", "Purple"],
            ["Green", "Purple"]
        ],
        // Level 3
        [
            ["Blue", "Green"],
            ["Green", "Blue", "Green"],
            ["Green", "Blue"]
        ]
    ]
    
    static var max = patterns.count
    
    static func getPattern(level: Int) -> Array<Array<String>> {
        return patterns[level - 1]
    }
    
    static func getFlattenedPattern(level: Int) -> Array<String> {
        return patterns[level - 1].flatMap { $0 }
    }
}
