//
//  GameBoard.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/10/23.
//

import SwiftUI

struct GameBoard: View {
    @EnvironmentObject var hexState: HexState
    
    var body: some View {
        VStack {
            ForEach(hexState.currentPattern, id: \.self) { row in
                HStack {
                    ForEach(row) { hex in
                        HexButton(hex: hex)
                    }
                }
            }
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard().environmentObject(HexState())
    }
}
