//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 13.08.2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
  static private let emojis = ["🚂", "🚀", "🚁", "🚜", "🚌", "🛴", "🚛", "🚑", "🚗", "🚕", "🚙", "🚎", "🚓", "🛩", "🛸", "🌁"]
  
  static private func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
      emojis[pairIndex]
    }
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  //MARK: - Intent(s)

  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
