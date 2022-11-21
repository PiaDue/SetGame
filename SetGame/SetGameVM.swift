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
        get{return model.cards}
    }
    
}
