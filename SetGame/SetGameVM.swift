//
//  SetGameVM.swift
//  SetGame
//
//  Created by Pia Dünow on 21.11.22.
//
// ViewModel

import SwiftUI

class SetGameVM: ObservableObject { //pronounces changes in the model to the view
    
    @Published private var model = GameLogic()
    
    //access to the cards
    var visibleCards: Array<GameLogic.Card>{
        get{getVisibleCards()}
    }
    
    func getVisibleCards() -> Array<GameLogic.Card>{
        var visibleCards: Array<GameLogic.Card> = []
        for i in 0 ..< model.cards.count {
            if model.cards[i].isVisible {
                visibleCards.append(model.cards[i])
            }
        }
        return visibleCards
    }
    
    static func getColor(card: GameLogic.Card) -> SwiftUI.Color {
        switch card.color {
        case .teal: return SwiftUI.Color.teal
        case .purple: return SwiftUI.Color.purple
        case .orange: return SwiftUI.Color.orange
        }
    }
    
    static func getOpacity(card: GameLogic.Card) -> Double {
        switch card.shading {
        case .open: return 0.0
        case .solid: return 1.0
        case .transparent: return 0.5
        }
    }
    
    // MARK: - Intents
    
    func set3NewCardsToVisible(){
        model.set3NewCardsToVisible()
    }
    
    func newGame(){
        model.newGame()
    }
    
}
