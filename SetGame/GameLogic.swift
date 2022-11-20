//
//  GameLogic.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//

import Foundation

struct GameLogic {
    private(set) var cards: Array<Card>
    private var indiciesOfSelectedCards: Array<Int>
    
    init(cards: Array<Card>, indiciesOfSelectedCards: Array<Int>) {
        self.cards = cards
        self.indiciesOfSelectedCards = indiciesOfSelectedCards
    }
    
    struct Card {
        let id: Int
        var isMatched: Bool = false
        let content: SetCardContent
        
    }
}

struct SetCardContent {
    /*
     let color: new three-value-datatype (using enum?)
     let shape:
     let shading:
     */
    /* new comment*/
    
    //created a new test branch for new functionality
    //added another comment for next function
}

