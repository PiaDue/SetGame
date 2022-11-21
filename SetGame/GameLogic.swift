//
//  GameLogic.swift
//  SetGame
//
//  Created by Pia Dünow on 20.11.22.
//
// Model

import Foundation

struct GameLogic {
    private(set) var cards: Array<Card>
    private var indiciesOfSelectedCards: Array<Int>
    
    init() {
        self.indiciesOfSelectedCards = []
        self.cards = []
        for cardIndex in 0...81 {
            // calculate card properties
            cards.append(Card(id: cardIndex))
        }
    }
    
    struct Card: Identifiable{
        let id: Int
        var isMatched: Bool = false
        //properties: color, shape, shading -> using enum ?
    }
}
