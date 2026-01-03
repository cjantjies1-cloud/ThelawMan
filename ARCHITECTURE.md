# Architecture Summary

- Overview: Modular Flutter app split into data, models, services, screens,
  widgets, and theme to improve testability and maintainability.

- Folder Layout:
  - `lib/`: main application code and modules.
  - `lib/models/`: data models (`lib/models/constitution_section.dart`).
  - `lib/services/`: data loading and business logic
    (`lib/services/content_service.dart`).
  - `lib/data/`: small static data maps used for quick dev
    (`lib/data/constitution_sections.dart`).
  - `lib/screens/`: UI pages such as
    [main splash](lib/screens/splash_screen.dart),
    [home](lib/screens/home_screen.dart),
    [section list](lib/screens/section_list_screen.dart),
    [section detail](lib/screens/section_detail_screen.dart), and
    [quiz](lib/screens/quiz_screen.dart).
  - `lib/widgets/`: small reusable widgets
    (`lib/widgets/faded_logo_background.dart`,
    `lib/widgets/section_card.dart`,
    `lib/widgets/search_bar.dart`).
  - `assets/`: static assets and JSON data
    (`assets/data/constitution_sections.json`,
    `assets/images/Legal Consultancy Logo with South African Flag.png`).

- Key files:
  - `lib/main.dart`: app entry; uses `lawManTheme` and starts at
    `SplashScreen` ([lib/main.dart](lib/main.dart)).
  - `lib/theme.dart`: centralized `lawManTheme` ThemeData.
  - `lib/models/constitution_section.dart`: typed model with `fromJson`
    factory.
  - `lib/services/content_service.dart`: loads
    `assets/data/constitution_sections.json` and converts to models.

- Current behavior:
  - The app shows `SplashScreen`, then navigates to `HomeScreen`.
  - `SectionListScreen` supports search and converts either the in-repo
    static `lib/data/constitution_sections.dart` or the JSON-loaded
    sections into `ConstitutionSection` instances for navigation to
    `SectionDetailScreen`.
  - `QuizScreen` is a placeholder UI ready for a quiz engine.

- How to run:

```bash
flutter pub get
flutter run
```

- Next recommended steps:
  - Populate JSON: expand
    `assets/data/constitution_sections.json` with all sections and
    metadata.
  - Persist search & caching: add local caching in `ContentService` and
    improve search filtering.
  - Quiz engine: implement question model, storage, and scoring; wire
    into `QuizScreen`.
  - Tests & CI: add widget and unit tests for services and screens; add
    CI checks.

- Notes:
  - I updated the app to use `lawManTheme`, a `FadedLogoBackground`
    widget for consistent branding, and moved screens/widgets into a
    modular structure for easier extension.
