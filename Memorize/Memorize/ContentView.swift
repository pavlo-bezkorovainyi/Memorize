//
//  ContentView.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 29.07.2021.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel: EmojiMemoryGame

  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)
      HStack {
        Text(viewModel.theme.name)
          .font(.custom("Avenir", size: 30))
        Spacer()
        Text("Score: \(viewModel.score)")
      }
      .padding()
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))]) {
          ForEach(viewModel.cards) { card in
            CardView(card: card)
              .aspectRatio(2/3, contentMode: .fit)
              .onTapGesture {
                viewModel.choose(card)
              }
          }
          .padding(1)
        }
      }
      .foregroundColor(viewModel.theme.color)
      .padding(.horizontal)
      VStack {
        themeMenu
      }
    }
  }
  
    var themeMenu: some View {
      Menu ("Choose Theme") {
        ForEach(Theme.allCases) { theme in
          Button {
            viewModel.theme = theme
          } label: {
            Text(theme.name)
          }
        }
      }
    }
  
}


struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if card.isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else if card.isMatched {
        shape.opacity(0)
      } else {
        shape.fill()
      }
    }
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
      .preferredColorScheme(.dark)
    ContentView(viewModel: game)
      .preferredColorScheme(.light)
  }
}
