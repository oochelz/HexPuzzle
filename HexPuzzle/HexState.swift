//
//  HexState.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

class HexState: ObservableObject {
    @Published var level = 1
    init() {}
    
    @Published var currentPattern: Array<Array<Hex>> = [
        [Hex(color: "Green"), Hex(color: "Green")],
        [Hex(color: "Green"), Hex(color: "Green"), Hex(color: "Green")],
        [Hex(color: "Green"), Hex(color: "Green")],
    ]
    
    func checkPattern() {
        let pattern = currentPattern.flatMap { $0.map { $0.color } }
        if (pattern == Levels.getFlattenedPattern(level: level)) {
            print("You did it!")
            if level <= Levels.max {
                level += 1
            }
        } else {
            print("Keep going.")
        }
    }
}
