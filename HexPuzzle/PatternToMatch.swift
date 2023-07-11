//
//  PatternToMatch.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/10/23.
//

import SwiftUI

struct PatternToMatch: View {
    @EnvironmentObject var hexState: HexState
    var pattern: Array<Array<String>>
    @State var isAnimating = false
    
    var body: some View {
        VStack {
            Text("Level " + String(hexState.level))
                .font(.title)
                .scaleEffect(isAnimating ?  1.3 : 1.0)
            VStack(alignment: .center, spacing: 2.0) {
                ForEach(pattern, id: \.self) { row in
                    HStack(alignment: .center, spacing: 5.0) {
                        ForEach(row, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 16.0, height: 16.0)
                        }
                    }
                }
            }
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
        }
    }
}

struct PatternToMatch_Previews: PreviewProvider {
    static var previews: some View {
        PatternToMatch(pattern: Levels.getPattern(level: 1)).environmentObject(HexState())
    }
}
