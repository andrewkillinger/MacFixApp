import XCTest
@testable import MacFixApp

@MainActor
final class MacFixAppTests: XCTestCase {
    func testAppStateStartsEmpty() {
        let state = AppState()
        XCTAssertTrue(state.activityLog.isEmpty)
        XCTAssertTrue(state.confirmBeforeAnyChange, "Safety default must be on.")
    }

    func testRecordAppendsEntry() {
        let state = AppState()
        state.record("Scanned desktop")
        XCTAssertEqual(state.activityLog.count, 1)
        XCTAssertEqual(state.activityLog.first?.summary, "Scanned desktop")
    }
}
