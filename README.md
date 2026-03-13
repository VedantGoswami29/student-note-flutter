# 📚 VG Notes — Student Note App

A beautifully designed Flutter note-taking app built specifically for students. Organize your lecture notes, assignments, exam prep, and research all in one place — with a fast, offline-first local database.

---

## ✨ Features

- **Create, Edit & Delete Notes** — Full CRUD with a clean, intuitive UI
- **5 Category Types** — Lecture, Assignment, Exam, Research, Other
- **Color-coded Cards** — Each category has its own accent color and icon
- **Search** — Real-time search across note titles and content
- **Category Filter** — Filter notes by category with animated chips
- **Swipe to Delete** — Swipe a note card left to delete it instantly
- **Offline-first** — All data stored locally using Isar database (no internet needed)
- **Date Tracking** — Notes show relative timestamps (Today, Yesterday, X days ago)
- **Responsive UI** — Smooth animations, polished shadows, and a consistent design system

---

## 📸 Screens

| Home | Add Note | Edit Note |
|------|----------|-----------|
| Browse all notes with search & filters | Create a note with title, content & category | Edit or delete an existing note |

---

## 🏗️ Project Structure

```
lib/
├── main.dart                  # App entry point, Isar DB initialization
├── model/
│   ├── note_model.dart        # Isar Note collection schema
│   ├── note_model.g.dart      # Auto-generated Isar code (do not edit)
│   └── note_database.dart     # CRUD operations (add, get, update, delete)
└── screens/
    ├── home_screen.dart        # Main screen with notes list, search, filters
    ├── add_note_screen.dart    # Form screen to create a new note
    └── edit_note_screen.dart   # Form screen to update or delete a note
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.x or higher)
- Dart 3.x
- Android Studio / Xcode (for device/emulator)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/student_note.git
cd student_note

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

> **Note:** The Isar generated file (`note_model.g.dart`) is already included. If you modify `note_model.dart`, re-run the generator:
> ```bash
> dart run build_runner build
> ```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| [`isar`](https://pub.dev/packages/isar) | ^3.1.0 | Local NoSQL database |
| [`isar_flutter_libs`](https://pub.dev/packages/isar_flutter_libs) | ^3.1.0 | Isar native binaries for Flutter |
| [`path_provider`](https://pub.dev/packages/path_provider) | ^2.0.0 | Locate app documents directory for DB storage |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | ^6.0.0 | Poppins font family |

### Dev Dependencies

| Package | Purpose |
|---------|---------|
| [`build_runner`](https://pub.dev/packages/build_runner) | Code generation runner |
| [`isar_generator`](https://pub.dev/packages/isar_generator) | Generates Isar collection code from annotations |

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  path_provider: ^2.1.2
  google_fonts: ^6.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.9
  isar_generator: ^3.1.0+1
```

---

## 🗃️ Data Model

```dart
@collection
class Note {
  Id id = Isar.autoIncrement;   // Auto-incremented unique ID
  late String title;            // Note title
  late String content;          // Note body text
  late String category;         // One of: Lecture, Assignment, Exam, Research, Other
  DateTime createdAt = DateTime.now();  // Creation timestamp
}
```

---

## 🎨 Design System

| Element | Value |
|---------|-------|
| Background | `#F5F5FA` |
| Primary color | `#6C63FF` (Lecture) |
| Assignment | `#FF6584` |
| Exam | `#FF9F43` |
| Research | `#26DE81` |
| Other | `#4ECDC4` |
| Font | Poppins (Google Fonts) |
| Border radius | 14–20px throughout |

---

## 🔧 Common Commands

```bash
# Run on connected device
flutter run

# Build release APK
flutter build apk --release

# Build release iOS
flutter build ios --release

# Re-generate Isar schema (after editing note_model.dart)
dart run build_runner build --delete-conflicting-outputs

# Clean build cache
flutter clean && flutter pub get
```

---

## 🐛 Known Issues / Fixes Applied

- **`withOpacity` deprecation** — All color opacity calls use `.withValues(alpha: x)` instead of the deprecated `.withOpacity()` to avoid precision loss (Flutter 3.27+)
- **Hex color format** — All `Color()` constructors use 8-digit hex (`0xFFFFFFFF`) as required by the latest Dart linter rules

---

## 🛣️ Roadmap

- [ ] Rich text editor support
- [ ] Note pinning / favorites
- [ ] Dark mode
- [ ] Note sharing (export to PDF / text)
- [ ] Reminder / due date for assignments
- [ ] Cloud sync

---

## 📄 License

This project is for personal and educational use.

---

> Built with ❤️ using Flutter & Isar