//
//  SetGameApp.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//

import SwiftUI

@main
struct SetGameApp: App {
    private let game = SetGameVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
