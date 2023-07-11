//
//  YouWon.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/10/23.
//

import SwiftUI

struct YouWon: View {
    var body: some View {
        VStack {
            Text("You did it!")
                .font(.largeTitle)
                .padding()
            withAnimation(.spring()) {
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Green"))
                    .font(.largeTitle)
            }
        }
    }
}

struct YouWon_Previews: PreviewProvider {
    static var previews: some View {
        YouWon()
    }
}
