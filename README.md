# LearnApp

A minimal Flutter project demonstrating clean architecture principles with navigation and list views.

## Features

- Simple start screen with 2 buttons
- Navigation to selection screen
- List display with 5 items (symbol + text)
- Clean project structure

## Project Structure

```
lib/
├── main.dart
├── app/app.dart
└── features/home/presentation/
    ├── home_page.dart
    ├── home_controller.dart
    └── selection_screen.dart
```

## Quick Start

```bash
flutter pub get
flutter run
flutter analyze
flutter test
```

## Architecture

- Minimal dependencies
- Feature-based folder structure
- Simple state management (StatelessWidget/StatefulWidget)
- No complex DI framework - ready to scale when needed

