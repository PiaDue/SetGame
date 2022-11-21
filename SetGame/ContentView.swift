//
//  ContentView.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//
// View

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameVM
    
    var body: some View {
        VStack {
            
            //Grid of Cards
            AspectVGrid(items: viewModel.cards, aspectRatio: 5/4, content: { card in
                cardView(for: card)
            })
            .foregroundColor(.black)
            
            //Buttons
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("+3 Cards")
                        .font(.title2)
                        .foregroundColor(Color.white)
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("New Game")
                        .font(.title2)
                        .foregroundColor(Color.white)
                }
            }
            .frame(height: 50.0)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func cardView(for card: GameLogic.Card) -> some View {
        CardView(card: card)//initial value for that card specifically
            .padding(4)
    }
}
    

// View of one Card
struct CardView: View {
    let card: GameLogic.Card
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: CardViewConstants.cornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: CardViewConstants.borderLineWidth)
        }
    }
    
    private struct CardViewConstants{
        static let cornerRadius: CGFloat = 10
        static let borderLineWidth: CGFloat = 3
    }
}





// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameVM()
        ContentView(viewModel: game)
            .previewDevice("iPhone 12 mini")
    }
}
