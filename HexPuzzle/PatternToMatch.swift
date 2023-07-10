//
//  PatternToMatch.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/10/23.
//

import SwiftUI

struct PatternToMatch: View {
    var pattern: Array<Array<String>>
    
    var body: some View {
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
    }
}

struct PatternToMatch_Previews: PreviewProvider {
    static var previews: some View {
        PatternToMatch(pattern: Levels.getPattern(level: 1))
    }
}
