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
        ],
        // Level 4
        [
            ["Pink", "Purple"],
            ["Blue", "Green", "Blue"],
            ["Purple", "Purple"]
        ],
        // Level 5
        [
            ["Green", "Green"],
            ["Green", "Orange", "Green"],
            ["Purple", "Purple"]
        ],
        // Level 6
        [
            ["Orange", "Pink"],
            ["Blue", "Blue", "Blue"],
            ["Pink", "Green"]
        ],
        // Level 7
        [
            ["Pink", "Purple"],
            ["Green", "Blue", "Green"],
            ["Purple", "Pink"]
        ],
        // Level 8
        [
            ["Green", "Green"],
            ["Green", "Purple", "Pink"],
            ["Green", "Orange"]
        ]
    ]
    
    static var max = patterns.count
    
    static func getPattern(level: Int) -> Array<Array<String>> {
        return patterns[level - 1]
    }
    
    static func getFlattenedPattern(level: Int) -> Array<String> {
        return patterns[level - 1].flatMap { $0 }
    }
    
    static func getStartingPattern() -> Array<Array<Hex>> {
        return [
            [Hex(color: "Green"), Hex(color: "Green")],
            [Hex(color: "Green"), Hex(color: "Green"), Hex(color: "Green")],
            [Hex(color: "Green"), Hex(color: "Green")],
        ]
    }
}
