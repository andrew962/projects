import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameSettings {
  final bool soundEnabled;
  final int timerDuration;
  final bool showQuestionCounter;

  const GameSettings({
    this.soundEnabled = true,
    this.timerDuration = 5,
    this.showQuestionCounter = false,
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
  }) =>
      GameSettings(
        soundEnabled: soundEnabled ?? this.soundEnabled,
        timerDuration: timerDuration ?? this.timerDuration,
        showQuestionCounter: showQuestionCounter ?? this.showQuestionCounter,
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

  Future<void> resetBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('bestScore', 0);
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, GameSettings>(
  (ref) => SettingsNotifier(),
);
