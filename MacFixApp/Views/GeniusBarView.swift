import SwiftUI

struct GeniusBarView: View {
    @State private var question: String = ""

    private let suggestions: [String] = [
        "My desktop is a mess",
        "My Mac feels slow",
        "I'm running out of space",
        "I have too many photos of the same thing",
        "I can't find a file I saved"
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Ask for Help")
                        .font(.system(size: 32, weight: .bold))
                    Text("Tell me what's going on in your own words. I'll explain what to do and ask before changing anything.")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("What's the trouble?").font(.headline)
                    TextEditor(text: $question)
                        .font(.title3)
                        .frame(minHeight: 120)
                        .padding(8)
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    Button {
                        // TODO: route question to the diagnosis engine.
                    } label: {
                        Label("Help me with this", systemImage: "sparkle")
                            .font(.title3.bold())
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(question.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Common things people ask").font(.headline)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 240), spacing: 12)], spacing: 12) {
                        ForEach(suggestions, id: \.self) { suggestion in
                            Button {
                                question = suggestion
                            } label: {
                                Text(suggestion)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(12)
                            }
                            .buttonStyle(.bordered)
                            .controlSize(.large)
                        }
                    }
                }
            }
            .padding(32)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    GeniusBarView()
        .environmentObject(AppState())
}
