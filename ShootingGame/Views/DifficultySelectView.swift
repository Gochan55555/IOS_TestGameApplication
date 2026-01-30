import SwiftUI

struct DifficultySelectView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        VStack(spacing: 20) {
            Text("難易度を選択")
                .font(.title)
                .bold()

            ForEach(GameState.Difficulty.allCases) { difficulty in
                Button {
                    gameState.selectDifficulty(difficulty)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(difficulty.rawValue)
                            .font(.title3)
                            .bold()
                        Text("敵: \(difficulty.enemyCount) / ボスHP: \(difficulty.bossHitPoints) / 残機: \(difficulty.startingLives)")
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

            Button("タイトルへ戻る") {
                gameState.resetToTitle()
            }
            .padding(.top, 12)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
    }
}

#Preview {
    DifficultySelectView()
        .environmentObject(GameState())
}
