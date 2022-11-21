//
//  GameLogic.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//
// model

import Foundation

struct GameLogic {
    private(set) var cards: Array<Card>
    private var indiciesOfSelectedCards: Array<Int>
    
    init() {
        self.indiciesOfSelectedCards = []
        self.cards = []
        for cardIndex in 0...81 {
            cards.append(Card(id: cardIndex))
        }
    }
    
    struct Card: Identifiable{
        let id: Int
        var isMatched: Bool = false
        //let content: SetCardContent
        
    }
}

struct SetCardContent {
    /*
     let color: new three-value-datatype (using enum?)
     let shape:
     let shading:
     */
    /* new comment*/
    
    //created new test branch
    //added another comment for next function with more details
}

