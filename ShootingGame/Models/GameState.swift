import Foundation

final class GameState: ObservableObject {
    enum Screen {
        case title
        case difficulty
        case ship
        case countdown
        case battle
        case gameOver
    }

    enum Difficulty: String, CaseIterable, Identifiable {
        case easy = "かんたん"
        case normal = "ふつう"
        case hard = "むずかしい"

        var id: String { rawValue }

        var enemyCount: Int {
            switch self {
            case .easy: return 15
            case .normal: return 25
            case .hard: return 35
            }
        }

        var bossHitPoints: Int {
            switch self {
            case .easy: return 8
            case .normal: return 12
            case .hard: return 16
            }
        }

        var startingLives: Int {
            switch self {
            case .easy: return 5
            case .normal: return 3
            case .hard: return 2
            }
        }
    }

    enum Ship: String, CaseIterable, Identifiable {
        case alpha = "ファルコン"
        case beta = "レイヴン"
        case gamma = "コメット"

        var id: String { rawValue }

        var description: String {
            switch self {
            case .alpha: return "バランス型の機体"
            case .beta: return "スピード重視の機体"
            case .gamma: return "火力重視の機体"
            }
        }
    }

    @Published var currentScreen: Screen = .title
    @Published var selectedDifficulty: Difficulty?
    @Published var selectedShip: Ship?
    @Published var countdown: Int = 3
    @Published var lives: Int = 3
    @Published var enemiesRemaining: Int = 0
    @Published var bossHitPoints: Int = 0
    @Published var bossSpawned: Bool = false
    @Published var bossDefeated: Bool = false

    func resetToTitle() {
        selectedDifficulty = nil
        selectedShip = nil
        countdown = 3
        lives = 3
        enemiesRemaining = 0
        bossHitPoints = 0
        bossSpawned = false
        bossDefeated = false
        currentScreen = .title
    }

    func goToDifficulty() {
        currentScreen = .difficulty
    }

    func selectDifficulty(_ difficulty: Difficulty) {
        selectedDifficulty = difficulty
        lives = difficulty.startingLives
        enemiesRemaining = difficulty.enemyCount
        bossHitPoints = difficulty.bossHitPoints
        bossSpawned = false
        bossDefeated = false
        currentScreen = .ship
    }

    func selectShip(_ ship: Ship) {
        selectedShip = ship
        startCountdown()
    }

    func startCountdown() {
        countdown = 3
        currentScreen = .countdown
    }

    func beginBattle() {
        currentScreen = .battle
    }

    func hitEnemy() {
        guard currentScreen == .battle else { return }
        if enemiesRemaining > 0 {
            enemiesRemaining -= 1
            if enemiesRemaining == 0 {
                bossSpawned = true
            }
        } else if bossSpawned && bossHitPoints > 0 {
            bossHitPoints -= 1
            if bossHitPoints == 0 {
                bossDefeated = true
                currentScreen = .gameOver
            }
        }
    }

    func takeDamage() {
        guard currentScreen == .battle else { return }
        if lives > 0 {
            lives -= 1
        }
        if lives == 0 {
            currentScreen = .gameOver
        }
    }
}
