//
//  HexButton.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

struct HexButton: View {
    @EnvironmentObject var hexState: HexState
    @StateObject var hex: Hex

    var body: some View {
        Button(action: {
            UISelectionFeedbackGenerator().selectionChanged()
            hex.changeColor()
            hexState.checkPattern()
        }) { }
            .buttonStyle(HexButtonStyle(color: Color($hex.color.wrappedValue), text: ""))
    }
}

struct HexButtonStyle: ButtonStyle {
    let color: Color
    let text: String
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Image(systemName: "hexagon.fill")
                .imageScale(.large)
                .foregroundColor(color)
                .font(.largeTitle)
            Text(text)
                .foregroundColor(.accentColor)
        }
        .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct HexButton_Previews: PreviewProvider {
    static var previews: some View {
        HexButton(hex: Hex(color: "Green")).environmentObject(HexState())
    }
}
