//
//  ContentView.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var hexState: HexState
    
    var body: some View {
        VStack {
            Text("Level " + String(hexState.level))
                .font(.title)
                .padding()
            Text("Tap to change colors")
                .font(.headline)
                .padding()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(HexState())
    }
}
