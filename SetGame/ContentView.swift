//
//  ContentView.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//
// View

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            //cards
            
            Spacer()
            
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("+3 Cards")
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("New Game")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
