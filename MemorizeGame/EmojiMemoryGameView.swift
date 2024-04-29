import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
  private let aspectRatio: CGFloat = 2/3
  
	private let spacing: CGFloat = 4

    var body: some View {
        VStack {
            cards
                .foregroundColor(viewModel.color)
            Button("Shuffle") {
				withAnimation {
					viewModel.shuffle()
				}
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardsView(card)
                .padding(spacing)
                .onTapGesture {
					withAnimation {
						viewModel.choose(card)
					}
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
