import SwiftUI

struct DesktopCleanupView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tidy My Desktop")
                        .font(.system(size: 32, weight: .bold))
                    Text("I'll group the items on your desktop — photos, documents, screenshots — into neat folders. You'll see a preview before anything moves.")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                GroupBox("How it will work") {
                    VStack(alignment: .leading, spacing: 10) {
                        BulletRow(symbol: "eye.fill", text: "Scan your desktop (read-only to start).")
                        BulletRow(symbol: "list.bullet.rectangle.portrait.fill", text: "Show you a plan: what moves where.")
                        BulletRow(symbol: "hand.thumbsup.fill", text: "Nothing moves until you say yes.")
                        BulletRow(symbol: "arrow.uturn.backward.circle.fill", text: "Everything is reversible — I'll leave a 'Put it back' button.")
                    }
                    .padding(8)
                }

                Button {
                    // TODO: kick off read-only desktop scan.
                } label: {
                    Label("Scan my desktop", systemImage: "magnifyingglass")
                        .font(.title3.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding(32)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct BulletRow: View {
    let symbol: String
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: symbol)
                .foregroundStyle(.tint)
                .frame(width: 22)
            Text(text).font(.body)
        }
    }
}

#Preview {
    DesktopCleanupView()
        .environmentObject(AppState())
}
