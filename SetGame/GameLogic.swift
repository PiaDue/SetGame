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
            // TODO: calculate card properties
            cards.append(Card(id: cardIndex))
        }
        //TODO: shuffle cards
        for cardIndex in 0..<12 {
            cards[cardIndex].isVisible = true
        }
    }
    
    mutating func set3NewCardsToVisible(){
        for i in 0..<cards.count {
            if !cards[i].isVisible && i<=81-3 {
                cards[i].isVisible = true
                cards[i+1].isVisible = true
                cards[i+2].isVisible = true
                return
            }
        }
    }
    
    struct Card: Identifiable{
        let id: Int
        var isMatched: Bool = false
        var isVisible: Bool = false
        //properties: color, shape, shading -> using enum ?
    }
}
