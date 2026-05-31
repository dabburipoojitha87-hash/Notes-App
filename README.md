# Minimal Notes App 📝✨

A fast, clean, and distraction-free notes application built with Flutter. Designed with a retro pixel-art aesthetic and built for speed, this app lets you focus on one thing: getting your thoughts down before you forget them at 2 AM.

Translation: open → type → save → leave. No philosophical journey required. 

## 🚀 Features

*   **Pixel-Perfect Aesthetic**: Custom theme with chunky borders, sharp edges, and pastel colors.
*   **Create & Edit**: A distraction-free editing screen to add a title and multi-line content.
*   **Color Coded**: Assign one of 8 pastel colors to your notes using the built-in color picker.
*   **Grid or List Layout**: Flip between a dense grid or comfortable list view on the home screen.
*   **Full Search**: Real-time filtering by note title or content to find what you're looking for instantly.
*   **Purely Local Storage**: Lightning-fast offline capability powered by Hive. No cloud backend, no account required. 
*   **State Management**: Built robustly with Riverpod 3.0.

## 🛠️ Tech Stack

*   **Framework**: [Flutter](https://flutter.dev/)
*   **State Management**: [Riverpod (`flutter_riverpod`)](https://riverpod.dev/)
*   **Database**: [Hive (`hive_flutter`)](https://docs.hivedb.dev/)
*   **Fonts**: Custom retro aesthetic using [Google Fonts](https://pub.dev/packages/google_fonts) (Silkscreen for headings, Monospace for body text).

## 🏃 Getting Started

1.  **Clone the repository** (if applicable) and ensure you have Flutter installed.
2.  **Get dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the app**, using your preferred device or emulator:
    ```bash
    flutter run
    ```

## 🏗️ Architecture Design

*   **State**: The app heavily utilizes `NotifierProvider` from Riverpod v3 to ensure performant state updates across search, themes, and CRUD operations.
*   **TypeAdapter**: A manual Hive `TypeAdapter` was written for the `Note` object, ensuring fast instantiation without relying on heavy `build_runner` code generation. 
*   **Theme**: The `AppTheme` handles visual consistency such as border width, colors, icon scaling, and font weighting centrally.

## 📸 Screenshots

<p align="center">
  <img src="Screenshots/Home (Grid View).jpeg" width="220">
  <img src="Screenshots/Home (List View).jpeg" width="220">
  <img src="Screenshots/Note Editor.jpeg" width="220">
</p>

---
_Designed to help you pretend you're productive._ 

Download latest APK:
https://github.com/dabburipoojitha87-hash/Notes-App/releases
