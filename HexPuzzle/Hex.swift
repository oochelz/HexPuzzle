//
//  Hex.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/10/23.
//

import SwiftUI

class Hex: Hashable, ObservableObject, Identifiable {
    @Published var color: String
    var id: UUID
    
    init(color: String) {
        self.color = color
        self.id = UUID()
    }
    
    func changeColor() {
        switch color {
        case "Green":
            color = "Purple"
        case "Purple":
            color = "Blue"
        case "Blue":
            color = "Green"
        default:
            color = "Green"
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Hex, rhs: Hex) -> Bool {
        return lhs.color == rhs.color
    }
}
