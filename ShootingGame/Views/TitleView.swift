import SwiftUI

struct TitleView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        VStack(spacing: 24) {
            Text("Star Blitz")
                .font(.system(size: 44, weight: .heavy, design: .rounded))
            Text("シューティングゲーム")
                .font(.title2)
                .foregroundStyle(.secondary)

            Button(action: gameState.goToDifficulty) {
                Text("スタート")
                    .font(.title3)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
    }
}

#Preview {
    TitleView()
        .environmentObject(GameState())
}
