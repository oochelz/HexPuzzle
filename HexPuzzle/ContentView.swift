//
//  ContentView.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var hexState: HexState
    @State var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            if !hexState.hasWon {
                Text("Level " + String(hexState.level))
                    .font(.title)
                    .scaleEffect(isAnimating ?  1.3 : 1.0)
                PatternToMatch(pattern: Levels.getPattern(level: hexState.level))
                    .padding()
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .onChange(of: hexState.level) {_ in
                        isAnimating = true
                        withAnimation(.spring()) {
                            isAnimating = false
                        }
                    }
                    .onAppear {
                        isAnimating = true
                        withAnimation(.spring()) {
                            isAnimating = false
                        }
                    }
                Text("Match the pattern!")
                    .font(.headline)
                    .padding()
                GameBoard()
            } else {
                YouWon()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(HexState())
    }
}
