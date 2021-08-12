//
//  ContentView.swift
//  Memorize
//
//  Created by Павел Бескоровайный on 29.07.2021.
//

import SwiftUI

struct ContentView: View {
  var vehiclesEmojis = ["🚂", "🚀", "🚁", "🚜", "🚌", "🛴", "🚛", "🚑", "🚗", "🚕", "🚙", "🚎", "🚓", "🛩", "🛸", "🌁"]
  var foodEmojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦"]
  var ballsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱"]
  @State var emojis: [String] = [""]
  
  var body: some View {
    VStack {
      Text("Memorize!")
        .font(.largeTitle)
      ScrollView{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
          ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
            CardView(content: emoji)
              .aspectRatio(2/3, contentMode: .fit)
          }
        }
      }
      .foregroundColor(.red)
      Spacer()
      HStack(spacing: 45) {
        vehicleThemeButton
        foodThemeButton
        ballsThemeButton
      }
    }
    .padding(.horizontal)
    .onAppear(perform: {
      emojis = vehiclesEmojis
    })
  }
  
  var vehicleThemeButton: some View {
    Button {
      emojis = vehiclesEmojis.shuffled()
    } label: {
      VStack{
        Image(systemName: "car").font(.largeTitle)
        Text("Vehicles").font(.custom("Avenir", fixedSize: 17))
      }
    }
  }
  
  var foodThemeButton: some View {
    Button {
      emojis = foodEmojis.shuffled()
    } label: {
      VStack {
        Image(systemName: "applelogo").font(.largeTitle)
        Text("Food").font(.custom("Avenir", fixedSize: 17))
      }
    }
  }
  
  var ballsThemeButton: some View {
    Button {
      emojis = ballsEmojis.shuffled()
    } label: {
      VStack {
        Image(systemName: "b.circle").font(.largeTitle)
        Text("Balls").font(.custom("Avenir", fixedSize: 17))
      }
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
    }
    ContentView()
      .preferredColorScheme(.light)
  }
}
