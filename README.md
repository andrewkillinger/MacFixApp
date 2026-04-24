# MacFixApp

A friendly macOS app that helps a non-technical user tidy their Mac — clean
up the desktop, find duplicate files and photos, and get plain-English
"Genius Bar" style help for common problems.

Built with SwiftUI for macOS 13+.

## Design principles

The whole app is built around one rule: **never surprise the user, never lose
their files.**

- **Nothing is ever permanently deleted.** Removed items go to the Trash.
- **Preview before change.** Every destructive action shows a plan first; the
  user has to say "yes" before anything moves or disappears.
- **Plain English, not jargon.** Buttons say "Tidy my desktop," not "Run
  heuristic file classifier." No error codes in the UI.
- **Large, calm UI.** Big type, high contrast, generous spacing. Designed for
  users who don't want to squint at a tiny menu bar.
- **Reversible by default.** Where possible, actions leave a "Put it back"
  button.
- **Sandboxed.** The app runs inside the macOS App Sandbox with only the
  entitlements it actually needs (user-selected files + Downloads).

## What's in the repo

```
MacFixApp/
├── project.yml                 XcodeGen spec — the source of truth for the Xcode project
├── MacFixApp/                  App source
│   ├── MacFixAppApp.swift      @main entry, window setup
│   ├── ContentView.swift       NavigationSplitView shell + sidebar
│   ├── Info.plist
│   ├── MacFixApp.entitlements
│   ├── Assets.xcassets/
│   ├── Models/
│   │   └── AppState.swift      Shared observable app state
│   └── Views/
│       ├── HomeView.swift
│       ├── GeniusBarView.swift       "Ask for help" free-text entry
│       ├── DesktopCleanupView.swift  Stub — desktop scan + sort
│       └── DuplicatesView.swift      Stub — duplicate file/photo finder
├── MacFixAppTests/             Unit tests
└── .github/workflows/ci.yml    Build + test on every push/PR
```

## Getting started

### One-time setup (macOS, Xcode 15+)

```bash
# 1. Install XcodeGen (project file generator)
brew install xcodegen

# 2. Generate the Xcode project from project.yml
xcodegen generate

# 3. Open in Xcode
open MacFixApp.xcodeproj
```

Hit ⌘R to run. The app window should open with the sidebar and welcome screen.

### Day-to-day

- `MacFixApp.xcodeproj` is **generated** — do not edit it by hand, and do not
  commit it. Edit `project.yml` instead, then re-run `xcodegen generate`.
- All source lives under `MacFixApp/`. Tests live under `MacFixAppTests/`.
- Run tests with ⌘U in Xcode, or `xcodebuild test` from the command line.

### Command-line build (what CI runs)

```bash
xcodegen generate
xcodebuild \
  -project MacFixApp.xcodeproj \
  -scheme MacFixApp \
  -configuration Debug \
  -destination 'platform=macOS' \
  CODE_SIGNING_ALLOWED=NO \
  test
```

## Roadmap

Near-term features to build out on top of this scaffold:

- [ ] **Desktop scan** — enumerate `~/Desktop`, classify by type/age/size,
      present a proposed folder layout.
- [ ] **Apply / Undo** — move files via `FileManager` + record a reversible
      operation log.
- [ ] **Duplicate finder** — user picks a folder, we group by content hash
      (SHA-256) and, for images, perceptual hash.
- [ ] **Genius Bar intents** — map natural-language questions ("my Mac is
      slow") to a small set of guided flows.
- [ ] **Activity log view** — show the user everything the app has done, with
      per-entry "Undo".
- [ ] **Accessibility pass** — Dynamic Type, VoiceOver labels, reduced-motion.

## Safety notes for contributors

If you're adding a feature that moves, renames, or deletes files:

1. Default to **read-only** first; land the UI before the write path.
2. Use `FileManager.trashItem(at:resultingItemURL:)` — never
   `removeItem(at:)`.
3. Show a confirmation sheet listing **every affected path** before acting.
4. Record the operation in `AppState.activityLog` so the user can see it.
5. Respect the sandbox — don't request entitlements beyond what the feature
   needs.
