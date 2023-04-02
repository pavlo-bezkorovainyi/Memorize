//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 13.08.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  @Published private var model: MemoryGame<String>
  
  dynamic var theme: Theme {
    willSet {
      model = recreateMemoryGame(with: newValue)
    }
  }
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  var score: Int {
    model.score
  }
  
  init() {
    self.theme = Theme.allCases.randomElement()!
    let numberOfCards = theme.numberPairOfCards
    let emojis = theme.emojis
    
    self.model = MemoryGame<String>(numberOfPairsOfCards: numberOfCards) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  private func recreateMemoryGame(with theme: Theme) -> MemoryGame<String> {
    let numberOfCards = theme.numberPairOfCards
    let emojis = theme.emojis
    
   return MemoryGame<String>(numberOfPairsOfCards: numberOfCards) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  //MARK: - Intent(s)

  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
