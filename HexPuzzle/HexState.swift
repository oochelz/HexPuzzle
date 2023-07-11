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
    
    func checkPattern() {
        let pattern = currentPattern.flatMap { $0.map { $0.color } }
        if (pattern == Levels.getFlattenedPattern(level: level)) {
            if level < Levels.max {
                level += 1
            } else {
                hasWon = true
            }
        }
    }
}
