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
            if(viewModel.getVisibleCards().count > 24){
                GeometryReader{ geometry in
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width/5))], spacing: 0.0){
                            ForEach (viewModel.visibleCards){ card in
                                cardView(for: card).aspectRatio(4/5, contentMode: .fit)
                            }
                        }.foregroundColor(.black)
                    }
                }
                
            }else{
                AspectVGrid(items: viewModel.visibleCards, aspectRatio: 4/5, content: { card in
                    cardView(for: card)
                })
                .foregroundColor(.black)
            }
            
            //Buttons
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("+3 Cards")
                        .font(.title2)
                        .foregroundColor(Color.white)
                }
                .onTapGesture {viewModel.set3NewCardsToVisible()}
                                
                ZStack {
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.accentColor)
                    Text("New Game")
                        .font(.title2)
                        .foregroundColor(Color.white)
                }
                .onTapGesture {viewModel.newGame()}
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
            buildcardContent()
                .padding(10)
        }
        .padding(4)
    }
    
    @ViewBuilder
    private func buildcardContent() -> some View {
        VStack{
            switch card.numOfShapes{
            case .one:
                buildshape()
            case .two:
                buildshape()
                buildshape()
            case .three:
                buildshape()
                buildshape()
                buildshape()
            }
        }
    }
    
    @ViewBuilder
    private func buildshape() -> some View {
        switch card.shape {
        case .rectangle:
            ZStack{
                RoundedRectangle(cornerRadius: 5).fill().aspectRatio(6/3, contentMode: .fit)
                    .opacity(SetGameVM.getOpacity(card: card))
                RoundedRectangle(cornerRadius: 5).strokeBorder(lineWidth: 2).aspectRatio(6/3, contentMode: .fit)
            }
            .foregroundColor(SetGameVM.getColor(card: card))
            
        case .diamond:
            ZStack{
                Circle().fill()
                    .opacity(SetGameVM.getOpacity(card: card))
                Circle().strokeBorder(lineWidth: 2)
            }
            .foregroundColor(SetGameVM.getColor(card: card))
            
        case .oval:
            ZStack{
                RoundedRectangle(cornerRadius: 50).fill().aspectRatio(6/3, contentMode: .fit)
                    .opacity(SetGameVM.getOpacity(card: card))
                RoundedRectangle(cornerRadius: 50).strokeBorder(lineWidth: 2).aspectRatio(6/3, contentMode: .fit)
            }
            .foregroundColor(SetGameVM.getColor(card: card))
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
