//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 29.07.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
  let game = EmojiMemoryGame()
  
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: game)
    }
  }
}
