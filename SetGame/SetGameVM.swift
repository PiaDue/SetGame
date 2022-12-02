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
    var cards: Array<GameLogic.Card>{
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
    
    func set3NewCardsToVisible(){
        model.set3NewCardsToVisible()
    }
    
}
