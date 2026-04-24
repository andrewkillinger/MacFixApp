import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome to MacFixApp")
                        .font(.system(size: 32, weight: .bold))
                    Text("Pick something from the list on the left, or ask me for help in plain English.")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 260), spacing: 16)], spacing: 16) {
                    HomeCard(
                        title: "Ask for Help",
                        subtitle: "Tell me what's wrong and I'll walk you through it.",
                        symbol: "bubble.left.and.bubble.right.fill"
                    )
                    HomeCard(
                        title: "Tidy My Desktop",
                        subtitle: "I'll sort what's on your desktop into neat folders.",
                        symbol: "sparkles"
                    )
                    HomeCard(
                        title: "Find Duplicates",
                        subtitle: "Spot copies of the same photo or file.",
                        symbol: "doc.on.doc.fill"
                    )
                }

                SafetyCallout()
            }
            .padding(32)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct HomeCard: View {
    let title: String
    let subtitle: String
    let symbol: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: symbol)
                .font(.system(size: 28))
                .foregroundStyle(.tint)
            Text(title).font(.title2.bold())
            Text(subtitle)
                .font(.body)
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .frame(maxWidth: .infinity, minHeight: 150, alignment: .topLeading)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
}

private struct SafetyCallout: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "lock.shield.fill")
                .font(.title2)
                .foregroundStyle(.green)
            VStack(alignment: .leading, spacing: 4) {
                Text("Nothing is deleted without your OK.")
                    .font(.headline)
                Text("Anything MacFixApp removes goes to the Trash, so you can always get it back.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(16)
        .background(.green.opacity(0.08), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
