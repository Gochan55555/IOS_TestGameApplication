import SwiftUI

struct CountdownView: View {
    @EnvironmentObject private var gameState: GameState
    @State private var timerActive = false

    var body: some View {
        VStack(spacing: 16) {
            Text("準備完了")
                .font(.title2)
                .bold()
            Text("\(gameState.countdown)")
                .font(.system(size: 72, weight: .heavy, design: .rounded))
                .foregroundStyle(.white)
                .padding()

            Text("まもなく戦闘開始")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground())
        .onAppear {
            guard !timerActive else { return }
            timerActive = true
            startTimer()
        }
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if gameState.countdown > 1 {
                gameState.countdown -= 1
            } else {
                timer.invalidate()
                gameState.beginBattle()
            }
        }
    }
}

#Preview {
    CountdownView()
        .environmentObject(GameState())
}
