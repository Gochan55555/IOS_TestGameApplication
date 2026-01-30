import SwiftUI

struct ShipSelectView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        VStack(spacing: 20) {
            Text("機体を選択")
                .font(.title)
                .bold()

            ForEach(GameState.Ship.allCases) { ship in
                Button {
                    gameState.selectShip(ship)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(ship.rawValue)
                            .font(.title3)
                            .bold()
                        Text(ship.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
            }

            Button("難易度選択へ戻る") {
                gameState.goToDifficulty()
            }
            .padding(.top, 12)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
    }
}

#Preview {
    ShipSelectView()
        .environmentObject(GameState())
}
