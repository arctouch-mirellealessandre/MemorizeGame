import SwiftUI

struct CardsView: View {
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
            .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
  VStack {
    HStack {
      CardsView(MemoryGame<String>.Card(isFaceUp: true, content: "X", id: "test1"))
      CardsView(MemoryGame<String>.Card(content: "X", id: "test1"))
        .aspectRatio(4/3, contentMode: .fit)
    }
    HStack {
      CardsView(MemoryGame<String>.Card(isFaceUp: true, content: "This is a very long string and I hope it fits", id: "test1"))
      CardsView(MemoryGame<String>.Card(isFaceUp: true, content: "X", id: "test1"))
    }
  }
  .padding()
  .foregroundStyle(.green)
}
