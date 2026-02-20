import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameSettings {
  final bool soundEnabled;
  final int timerDuration;
  final bool showQuestionCounter;
  final String locale;

  const GameSettings({
    this.soundEnabled = true,
    this.timerDuration = 5,
    this.showQuestionCounter = false,
    this.locale = 'es',
  });

  int get livesCount {
    switch (timerDuration) {
      case 10:
        return 7;
      case 3:
        return 3;
      default:
        return 5;
    }
  }

  GameSettings copyWith({
    bool? soundEnabled,
    int? timerDuration,
    bool? showQuestionCounter,
    String? locale,
  }) =>
      GameSettings(
        soundEnabled: soundEnabled ?? this.soundEnabled,
        timerDuration: timerDuration ?? this.timerDuration,
        showQuestionCounter: showQuestionCounter ?? this.showQuestionCounter,
        locale: locale ?? this.locale,
      );
}

class SettingsNotifier extends StateNotifier<GameSettings> {
  SettingsNotifier() : super(const GameSettings()) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = GameSettings(
      soundEnabled: prefs.getBool('soundEnabled') ?? true,
      timerDuration: prefs.getInt('timerDuration') ?? 5,
      showQuestionCounter: prefs.getBool('showQuestionCounter') ?? false,
      locale: prefs.getString('locale') ?? 'es',
    );
  }

  Future<void> toggleSound() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !state.soundEnabled;
    await prefs.setBool('soundEnabled', newValue);
    state = state.copyWith(soundEnabled: newValue);
  }

  Future<void> setTimerDuration(int duration) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('timerDuration', duration);
    state = state.copyWith(timerDuration: duration);
  }

  Future<void> toggleQuestionCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !state.showQuestionCounter;
    await prefs.setBool('showQuestionCounter', newValue);
    state = state.copyWith(showQuestionCounter: newValue);
  }

  Future<void> setLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale);
    state = state.copyWith(locale: locale);
  }

  Future<void> resetBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('bestScore', 0);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, GameSettings>(
  (ref) => SettingsNotifier(),
);
