import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var appState: AppState
    @State private var selection: Destination? = .home

    var body: some View {
        NavigationSplitView {
            List(Destination.allCases, selection: $selection) { destination in
                NavigationLink(value: destination) {
                    Label(destination.title, systemImage: destination.symbol)
                        .font(.title3)
                        .padding(.vertical, 6)
                }
            }
            .navigationTitle("MacFixApp")
            .frame(minWidth: 220)
        } detail: {
            switch selection ?? .home {
            case .home:            HomeView()
            case .geniusBar:       GeniusBarView()
            case .desktopCleanup:  DesktopCleanupView()
            case .duplicates:      DuplicatesView()
            }
        }
    }
}

enum Destination: String, CaseIterable, Identifiable {
    case home
    case geniusBar
    case desktopCleanup
    case duplicates

    var id: String { rawValue }

    var title: String {
        switch self {
        case .home:           return "Home"
        case .geniusBar:      return "Ask for Help"
        case .desktopCleanup: return "Tidy My Desktop"
        case .duplicates:     return "Find Duplicates"
        }
    }

    var symbol: String {
        switch self {
        case .home:           return "house.fill"
        case .geniusBar:      return "bubble.left.and.bubble.right.fill"
        case .desktopCleanup: return "sparkles"
        case .duplicates:     return "doc.on.doc.fill"
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
