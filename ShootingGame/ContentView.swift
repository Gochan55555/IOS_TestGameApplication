import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var gameState: GameState

    var body: some View {
        ZStack {
            switch gameState.currentScreen {
            case .title:
                TitleView()
            case .difficulty:
                DifficultySelectView()
            case .ship:
                ShipSelectView()
            case .countdown:
                CountdownView()
            case .battle:
                BattleView()
            case .gameOver:
                GameOverView()
            }
        }
        .animation(.easeInOut, value: gameState.currentScreen)
    }
}

#Preview {
    ContentView()
        .environmentObject(GameState())
}
