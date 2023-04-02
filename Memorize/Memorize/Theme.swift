//
//  Theme.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 02.04.2023.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
  case vehicle
  case food
  case balls
  case hearts
  case animals
  case clocks
  
  
  var emojis: [String] {
    switch self {
    case .vehicle:
      return ["🚂", "🚀", "🚁", "🚜", "🚌", "🛴", "🚛", "🚑", "🚗"]
    case .food:
      return ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓"]
    case .balls:
      return ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]
    case .hearts:
      return ["🧡","💚","❤️", "💙", "💜", "🖤", "🤍", "💕"]
    case .animals:
      return ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯"]
    case .clocks:
      return ["🕐", "🕑", "🕒", "🕓", "🕔", "🕕", "🕖", "🕗", "🕘", "🕙", "🕚", "🕛"]

    }
  }
  
  var name: String {
    self.rawValue.capitalized
  }
  
  var numberPairOfCards: Int {
    let emojisCount = self.emojis.count
    switch self {
    case .balls:
      return (2..<emojisCount).randomElement()!
    default:
      return emojisCount
    }
  }
  
  var color: Color {
    switch self {
    case .vehicle:
      return .blue
    case .food:
      return .yellow
    case .balls:
      return .purple
    case .hearts:
      return .red
    case .animals:
      return .green
    case .clocks:
      return .gray
    }
  }
  
  var id: Self {
    return self
  }
}
