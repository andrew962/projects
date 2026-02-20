# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Juego de Banderas** is a Flutter mobile app where players identify countries from their flags. It features multiple difficulty levels, lives system, streak bonuses, sound effects, and persistent best scores.

## Common Commands

```bash
# Run the app
flutter run

# Run with environment override
flutter run --dart-define=config=staging

# Build APK
flutter build apk --dart-define=config=staging

# Install/update dependencies
flutter pub get

# Run code generation (for Freezed/Riverpod)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs

# Run tests
flutter test

# Lint
flutter analyze
```

## Architecture

### State Management: Riverpod
Uses `StateNotifier` pattern. Key providers:
- `settingsProvider` — game settings (difficulty, sound, best score) persisted via `SharedPreferences`
- `preCacheQuestionProvider` — pre-fetches next question during gameplay
- `appRouter` — GoRouter instance

### Routing: GoRouter (`lib/config/routes/app_routes.dart`)
- `/` → `HomePage`
- `/new-game` → `NewGamePage`
- `/settings` → `SettingsPage` (accepts `gameInProgress` via `state.extra`)
- `/results` → `ResultsPage` (requires stats map via `state.extra`, redirects home if missing)

### Dependency Injection: GetIt (`lib/dependecies.dart`)
Lazy singletons: `ApiClient`, `ReadJson`, `FlagGameRepository`. Access via `GetIt.instance<T>()`.

### Data Layer: `../package/data/`
External local package. `FlagGameRepository` provides questions and flag pool management. `GameService` (`lib/services/game.service.dart`) wraps it for use in pages.

### Game Flow
1. `NewGamePage` calls `GameService.newQuestion()` → fetches from repository
2. After each answer, `GameService.deleteFlagID()` removes the flag from the pool
3. On game over, stats are passed to `/results` via `state.extra`
4. `GameService.resetGame()` restores the full flag pool on new game

### Scoring & Difficulty
| Difficulty | Timer | Lives |
|------------|-------|-------|
| Easy       | 10s   | 7     |
| Normal     | 5s    | 5     |
| Hard       | 3s    | 3     |

Streak bonuses: +1 point at 3-streak, +2 points at 5+-streak.

### Environment
Config in `env/.env`:
- `BASE_URL` — API base URL
- `PATH_FLAGS_JSON` — path to flags data (default: `assets/flags.json`)

Loaded with `flutter_dotenv` at startup in `main.dart`.

## Key Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | App entry, dotenv init, DI setup, ProviderScope |
| `lib/dependecies.dart` | GetIt registrations |
| `lib/pages/game_page.dart` | Core gameplay (timer, scoring, lives, sound) |
| `lib/providers/settings_provider.dart` | Settings state + SharedPreferences persistence |
| `lib/services/game.service.dart` | Thin wrapper over FlagGameRepository |
| `lib/widgets/animated_button.widget.dart` | Reusable button used across all pages |
| `assets/flags.json` | Flag/country database (185 entries) |

## Conventions

- **Barrel files**: Each feature folder has an export file (`pages.dart`, `providers.dart`, `services.dart`). Import from these, not individual files.
- **Font**: `BubblerOne` (Google Fonts) used throughout UI.
- **Sound keys**: `pop_up.mp3`, `correct.mp3`, `wrong_answer.mp3`, `error.mp3`, `fail.mp3` in `assets/sounds/`.
- **SharedPreferences keys**: `soundEnabled`, `timerDuration`, `showQuestionCounter`, `bestScore`.
- UI language is Spanish.


  ---                                                                                                          
  Errores críticos (pueden crashear la app)

  1. Sin manejo de errores en newQuestion() (game_page.dart:91)
  QuestionModel newQuestion = await gameService.newQuestion(); // sin try-catch
  Cualquier fallo en datos o JSON crashea la app en plena partida.

  1. Sin manejo de errores en el JSON del repositorio (flag_game_repository.dart)
  jsonDecode y el parsing del JSON se ejecutan sin protección.

  ---
  Problemas de arquitectura / estado

  4. Mezcla de setState con Riverpod (game_page.dart)
  El juego tiene 14+ variables de estado local (currentScore, lives, currentStreak, etc.) manejadas con
  setState, mientras que la configuración usa Riverpod. Debería existir un GameNotifier que centralice el
  estado del juego.

  5. SettingsNotifier con carga asíncrona sin await (settings_provider.dart:39)
  SettingsNotifier() : super(const GameSettings()) {
      _load(); // sin await, no hay forma de saber cuándo termina
  }
  La UI muestra valores por defecto antes de cargar los reales desde SharedPreferences.

  6. GameService instanciado como campo de clase, no dispuesto (game_page.dart:24)
  GameService gameService = GameService(); // se crea sin control
  Debería inyectarse o manejarse con el ciclo de vida del widget.

  7. preCacheQuestionProvider nunca se usa (pre_cache_question.dart)
  El provider existe pero no está conectado a nada. O se implementa o se elimina.

  ---
  Bugs de lógica

  8. Selección aleatoria sesgada (flag_game_repository.dart:31)
  flags.shuffle();
  return flags[Random().nextInt(3)]; // siempre toma de los primeros 3
  Mezcla la lista entera pero solo elige entre los primeros 3 elementos → distribución no uniforme.

  9. Timer no se reanuda si el usuario sale de Settings con el botón del sistema
  El código hace pause()/resume() alrededor del push a settings, pero si el usuario usa el gesto de swipe-back
  de iOS o el botón de Android, el resume() no se ejecuta → el timer queda congelado.

  ---
  UX / UI

  10. Diálogo de salida en HomePage no tiene botón "No"
  El AlertDialog solo tiene "Sí". El usuario no puede cancelar sin cerrar el diálogo.

  ---
  Calidad de código (menor urgencia)

  #: 11
  Problema: Typo en nombre de archivo: dependecies.dart
  Archivo: lib/dependecies.dart
  ────────────────────────────────────────
  #: 12
  Problema: initState vacío innecesario
  Archivo: home_page.dart
  ────────────────────────────────────────
  #: 13
  Problema: Método sharedPreferences() que solo llama a SharedPreferences.getInstance() sin agregar nada
  Archivo: game_page.dart
  ────────────────────────────────────────
  #: 14
  Problema: build() de 270+ líneas sin extraer componentes
  Archivo: game_page.dart
  ────────────────────────────────────────
  #: 15
  Problema: Import comentado que nunca se limpió
  Archivo: home_page.dart:2
  ────────────────────────────────────────
  #: 16
  Problema: Magic numbers: colores, bonus de streak, tiempos hardcodeados
  Archivo: varios