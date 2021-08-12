//
//  ContentView.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 29.07.2021.
//

import SwiftUI

struct ContentView: View {
  var emojis = ["🚂", "🚀", "🚁", "🚜", "🚌", "🛴", "🚛", "🚑", "🚗", "🚕", "🚙", "🚎", "🚓", "🛩", "🛸", "🌁"]
  @State var emojiCount = 15
  
  var body: some View {
    VStack {
      ScrollView{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 100))]) {
          ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
      Spacer()
      HStack {
        remove
        Spacer()
        add
      }
      .font(.largeTitle)
      .padding(.horizontal)
    }
    .padding(.horizontal)
  }
  
  var add: some View {
    Button {
      guard emojiCount < emojis.count else { return }
      emojiCount += 1
    } label: {
      Image(systemName: "plus.circle")
    }
  }
  
  var remove: some View {
    Button {
      guard emojiCount > 1 else { return }
      emojiCount -= 1
    } label: {
      Image(systemName: "minus.circle")
    }
  }
  
  
}


struct CardView: View {
  var content: String
  @State var isFaceUp = true
  
  var body: some View {
    ZStack {
      let shape = RoundedRectangle(cornerRadius: 20)
      if isFaceUp {
        shape.fill().foregroundColor(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
    .onTapGesture {
      isFaceUp = !isFaceUp
    }
  }
}








struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.dark)
      ContentView()
        .preferredColorScheme(.dark)
    }
    ContentView()
      .preferredColorScheme(.light)
  }
}
