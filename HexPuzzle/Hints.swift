//
//  Hints.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/16/23.
//

import SwiftUI

class Hints {
    var hints = [
        "The board will flip when you have one pink and one orange 💞",
        "Strange things are happening... Are you hexed? 🔮",
        "Yes, the orange hexes are random 😈",
        "Having three blue hexes will cause a ✨ certain color ✨ to turn pink.",
    ]
    var hintIndex = 0
    
    func next() {
        hintIndex += 1
        if hintIndex >= hints.count { hintIndex = 0 }
    }
    
    func print() -> String {
        return hints[hintIndex]
    }
}
