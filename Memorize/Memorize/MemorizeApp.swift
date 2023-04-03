//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 29.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
  private let game = EmojiMemoryGame()
  
  var body: some Scene {
    WindowGroup {
      EmojiMemoryGameView(game: game)
    }
  }
}
