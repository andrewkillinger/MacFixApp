import SwiftUI

struct DuplicatesView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Find Duplicates")
                        .font(.system(size: 32, weight: .bold))
                    Text("I'll look for files and photos that are the same. You choose which copy to keep — I never pick for you.")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                GroupBox("How it will work") {
                    VStack(alignment: .leading, spacing: 10) {
                        BulletRow(symbol: "folder.fill", text: "Pick a folder to check (your Desktop, Pictures, etc.).")
                        BulletRow(symbol: "doc.on.doc.fill", text: "I group matching files side by side.")
                        BulletRow(symbol: "checkmark.circle.fill", text: "You tick the copies to remove.")
                        BulletRow(symbol: "trash.fill", text: "Removed copies go to the Trash — nothing is gone forever.")
                    }
                    .padding(8)
                }

                Button {
                    // TODO: present folder picker and start duplicate scan.
                } label: {
                    Label("Choose a folder to scan", systemImage: "folder.badge.questionmark")
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

#Preview {
    DuplicatesView()
        .environmentObject(AppState())
}
