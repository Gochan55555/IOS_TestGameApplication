import SwiftUI

struct BattleView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Text("バトル開始")
                    .font(.title)
                    .bold()
                Text(statusText)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            HStack(spacing: 16) {
                StatCard(title: "残機", value: "\(gameState.lives)")
                StatCard(title: "雑魚", value: "\(gameState.enemiesRemaining)")
                StatCard(title: "ボスHP", value: "\(gameState.bossHitPoints)")
            }

            Spacer()

            VStack(spacing: 12) {
                Button {
                    gameState.hitEnemy()
                } label: {
                    Text(fireButtonTitle)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }

                Button {
                    gameState.takeDamage()
                } label: {
                    Text("被弾する")
                        .font(.body)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .padding(.bottom, 32)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
    }

    private var statusText: String {
        if gameState.bossDefeated {
            return "ボス撃破！"
        }
        if gameState.bossSpawned {
            return "ボス出現！強敵に備えよう"
        }
        return "大量の雑魚が接近中"
    }

    private var fireButtonTitle: String {
        if gameState.bossSpawned {
            return "ボスに攻撃"
        }
        return "ショット"
    }
}

private struct StatCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.title3)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    BattleView()
        .environmentObject(GameState())
}
