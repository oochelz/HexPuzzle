//
//  ContentView.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var hexState: HexState
    @State private var showingHint = false
    private var hints = Hints()
    
    var body: some View {
        VStack {
            Spacer()
            if !hexState.hasWon {
                PatternToMatch(pattern: Levels.getPattern(level: hexState.level))
                Text("Match the pattern!")
                    .font(.headline)
                    .padding()
            } else {
                Text("✨ You did it! ✨")
                    .font(.largeTitle)
                    .padding()
            }
            GameBoard()
            Spacer()
            HStack{
                Button("Restart Game") {
                    hexState.reset()
                }
                .padding()
                .background(Color("Gray"))
                .clipShape(Capsule())
                .controlSize(.mini)
                Button("") {
                    hints.next()
                    showingHint = true
                }
                .buttonStyle(HexButtonStyle(color: Color("Gray"), text: "?"))
                .alert(hints.print(), isPresented: $showingHint) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(HexState())
    }
}
