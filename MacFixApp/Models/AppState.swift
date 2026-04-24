import Foundation
import SwiftUI

/// Global, observable application state.
///
/// Keep this small and deliberate: anything that lives here is shared across
/// the whole app and survives view lifecycle. Per-screen state should stay
/// local to that screen's view model.
@MainActor
final class AppState: ObservableObject {
    /// Safety rail: no file is ever permanently deleted. Items are moved to
    /// the Trash and the user is shown exactly what happened.
    @Published var confirmBeforeAnyChange: Bool = true

    /// Optional activity log the user can review ("what did MacFixApp do?").
    @Published private(set) var activityLog: [ActivityEntry] = []

    func record(_ summary: String) {
        activityLog.append(ActivityEntry(date: .now, summary: summary))
    }
}

struct ActivityEntry: Identifiable, Hashable {
    let id = UUID()
    let date: Date
    let summary: String
}
