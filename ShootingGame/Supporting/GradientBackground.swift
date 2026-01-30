import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [Color.black, Color.blue.opacity(0.7), Color.purple.opacity(0.6)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
