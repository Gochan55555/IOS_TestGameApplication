import SwiftUI

struct GameOverView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        VStack(spacing: 20) {
            Text(gameState.bossDefeated ? "ミッション完了" : "ゲームオーバー")
                .font(.system(size: 40, weight: .heavy))
            Text(resultMessage)
                .font(.title3)
                .foregroundStyle(.secondary)

            Button("タイトルへ戻る") {
                gameState.resetToTitle()
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(Color.white.opacity(0.2))
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
    }

    private var resultMessage: String {
        if gameState.bossDefeated {
            return "最後のボスを撃破しました"
        }
        return "残機が尽きました"
    }
}

#Preview {
    GameOverView()
        .environmentObject(GameState())
}
