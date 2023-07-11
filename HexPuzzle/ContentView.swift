//
//  ContentView.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

// TODO: Make a better transition to Winning screen.
// TODO: Restart level instead of whole game.
// TODO: Navigation buttons (Reset, Info)

struct ContentView: View {
    @EnvironmentObject var hexState: HexState
    
    var body: some View {
        VStack {
            if !hexState.hasWon {
                PatternToMatch(pattern: Levels.getPattern(level: hexState.level))
                Text("Match the pattern!")
                    .font(.headline)
                    .padding()
                GameBoard()
            } else {
                YouWon()
            }
            Button("Restart Game") {
                hexState.reset()
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(HexState())
    }
}
