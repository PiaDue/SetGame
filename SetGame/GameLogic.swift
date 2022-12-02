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
        var cardIndex = 0
        // calculate card properties
        for numProperty in Card.NumOfShapes.allCases {
            for shapeProperty in Card.Shape.allCases {
                for colorProperty in Card.Color.allCases{
                    for shadingProperty in Card.Shading.allCases{
                        cards.append(Card(id: cardIndex, numOfShapes: numProperty, shape: shapeProperty, color: colorProperty, shading: shadingProperty))
                        cardIndex+=1
                    }
                }
            }
        }
    
        
        cards.shuffle()
        
        for i in 0..<12 {
            self.cards[i].isVisible = true
        }
    }
    
    mutating func set3NewCardsToVisible(){
        for i in 0..<cards.count {
            if !cards[i].isVisible && i<=80-2 {
                cards[i].isVisible = true
                cards[i+1].isVisible = true
                cards[i+2].isVisible = true
                return
            }
        }
    }
    
    mutating func newGame(){
        self = GameLogic()
    }
    
    
    struct Card: Identifiable{
        let id: Int
        var isMatched: Bool = false
        var isVisible: Bool = false
        
        
        //card properties
        let numOfShapes: NumOfShapes
        let shape: Shape
        let color: Color
        let shading: Shading
        
        
        enum NumOfShapes: CaseIterable {
            case one,two,three
        }
        enum Shape: CaseIterable {
            case oval,rectangle,diamond
        }
        enum Color: CaseIterable {
            case purple,teal,orange
        }
        enum Shading: CaseIterable {
            case solid,open,transparent
        }
    }
}
