//
//  HexPuzzleApp.swift
//  HexPuzzle
//
//  Created by Chelsea Youmans on 7/9/23.
//

import SwiftUI

@main
struct HexPuzzleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(HexState())
        }
    }
}
