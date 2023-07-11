//
//  HexState.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

class HexState: ObservableObject {
    @Published var level = 1
    @Published var hasWon = false
    @Published var currentPattern: Array<Array<Hex>> = [
        [Hex(color: "Green"), Hex(color: "Green")],
        [Hex(color: "Green"), Hex(color: "Green"), Hex(color: "Green")],
        [Hex(color: "Green"), Hex(color: "Green")],
    ]
    
    init() {}
    
    func reset() {
        level = 1
        hasWon = false
        currentPattern = [
            [Hex(color: "Green"), Hex(color: "Green")],
            [Hex(color: "Green"), Hex(color: "Green"), Hex(color: "Green")],
            [Hex(color: "Green"), Hex(color: "Green")],
        ]
    }
    
    func checkPattern() {
        var pattern = currentPattern.flatMap { $0.map { $0.color } }
        if (pattern == Levels.getFlattenedPattern(level: level)) {
            if level < Levels.max {
                level += 1
            } else {
                hasWon = true
            }
            return;
        }
        
        applySideEffects(pattern)
        
        // Recheck the board for a win with the side effects
        pattern = currentPattern.flatMap { $0.map { $0.color } }
        if (pattern == Levels.getFlattenedPattern(level: level)) {
            if level < Levels.max {
                level += 1
            } else {
                hasWon = true
            }
        }
    }
    
    func applySideEffects(_ pattern: [String]) {
        if pattern.filter({ $0 == "Blue" }).count == 3 {
            for row in currentPattern {
                for hex in row {
                    if hex.color == "Purple" {
                        hex.color = "Pink"
                    }
                }
            }
        }
        
        if Int.random(in: 0...3) == 1 {
            currentPattern.randomElement()?.randomElement()?.color = "Yellow"
        }
        
        if pattern.filter({ $0 == "Yellow" }).count == 1 && pattern.filter({ $0 == "Pink" }).count == 1 {
            currentPattern.reverse()
        }
    }
}
