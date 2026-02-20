import 'package:core/l10n/app_localizations.dart';
import 'package:flag_game/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends ConsumerStatefulWidget {
  final bool isGameInProgress;

  const SettingsPage({super.key, this.isGameInProgress = false});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  static const backgroundColor = Color(0xFF5DA6A7);

  void _confirmResetScore() {
    final localizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: const Color(0xFFFFB5B5),
            title: Text(
              localizations.resetRecordQuestion,
              style: GoogleFonts.bubblerOne(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              localizations.bestScoreWillBeDeleted,
              style: GoogleFonts.bubblerOne(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  localizations.cancel,
                  style: GoogleFonts.bubblerOne(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.read(settingsProvider.notifier).resetBestScore();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        localizations.recordReset,
                        style: GoogleFonts.bubblerOne(),
                      ),
                      backgroundColor: backgroundColor,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  localizations.reset,
                  style: GoogleFonts.bubblerOne(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[800],
                  ),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          localizations.settings.toUpperCase(),
          style: GoogleFonts.bubblerOne(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionCard(
              children: [
                _SettingRow(
                  icon:
                      settings.soundEnabled
                          ? Icons.volume_up
                          : Icons.volume_off,
                  label: localizations.sound,
                  trailing: Switch(
                    value: settings.soundEnabled,
                    onChanged: (_) => notifier.toggleSound(),
                    activeColor: backgroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _SettingRow(
                    icon: Icons.timer,
                    label: localizations.difficulty,
                    trailing:
                        widget.isGameInProgress
                            ? const Icon(
                              Icons.lock,
                              color: Colors.white54,
                              size: 18,
                            )
                            : null,
                  ),
                ),
                if (widget.isGameInProgress)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      localizations.notAvailableDuringGame,
                      style: GoogleFonts.bubblerOne(
                        fontSize: 13,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                Row(
                  children: [
                    _DifficultyButton(
                      label: localizations.easy,
                      subtitle: '10s',
                      selected: settings.timerDuration == 10,
                      color: const Color(0xFFB8E2C8),
                      onTap:
                          widget.isGameInProgress
                              ? () {}
                              : () => notifier.setTimerDuration(10),
                      disabled: widget.isGameInProgress,
                    ),
                    const SizedBox(width: 8),
                    _DifficultyButton(
                      label: localizations.normal,
                      subtitle: '5s',
                      selected: settings.timerDuration == 5,
                      color: const Color(0xFFFFF1A6),
                      onTap:
                          widget.isGameInProgress
                              ? () {}
                              : () => notifier.setTimerDuration(5),
                      disabled: widget.isGameInProgress,
                    ),
                    const SizedBox(width: 8),
                    _DifficultyButton(
                      label: localizations.hard,
                      subtitle: '3s',
                      selected: settings.timerDuration == 3,
                      color: const Color(0xFFFFB5B5),
                      onTap:
                          widget.isGameInProgress
                              ? () {}
                              : () => notifier.setTimerDuration(3),
                      disabled: widget.isGameInProgress,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              children: [
                _SettingRow(
                  icon: Icons.format_list_numbered,
                  label: localizations.questionCounter,
                  trailing: Switch(
                    value: settings.showQuestionCounter,
                    onChanged: (_) => notifier.toggleQuestionCounter(),
                    activeColor: backgroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              children: [
                _SettingRow(
                  icon: Icons.language,
                  label: localizations.language,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _DifficultyButton(
                      label: 'ES',
                      subtitle: 'Español',
                      selected: settings.locale == 'es',
                      color: const Color(0xFFB8E2C8),
                      onTap: () => notifier.setLocale('es'),
                    ),
                    const SizedBox(width: 8),
                    _DifficultyButton(
                      label: 'EN',
                      subtitle: 'English',
                      selected: settings.locale == 'en',
                      color: const Color(0xFFA6C8FF),
                      onTap: () => notifier.setLocale('en'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              children: [
                InkWell(
                  onTap: widget.isGameInProgress ? null : _confirmResetScore,
                  borderRadius: BorderRadius.circular(12),
                  child: _SettingRow(
                    icon: Icons.delete_outline,
                    label: localizations.resetRecord,
                    iconColor:
                        widget.isGameInProgress
                            ? Colors.white30
                            : Colors.red[700]!,
                    labelColor:
                        widget.isGameInProgress
                            ? Colors.white30
                            : Colors.red[700]!,
                    trailing:
                        widget.isGameInProgress
                            ? const Icon(
                              Icons.lock,
                              color: Colors.white30,
                              size: 18,
                            )
                            : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;

  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget? trailing;
  final Color iconColor;
  final Color labelColor;

  const _SettingRow({
    required this.icon,
    required this.label,
    this.trailing,
    this.iconColor = Colors.white,
    this.labelColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.bubblerOne(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: labelColor,
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _DifficultyButton extends StatelessWidget {
  final String label;
  final String subtitle;
  final bool selected;
  final Color color;
  final VoidCallback onTap;
  final bool disabled;

  const _DifficultyButton({
    required this.label,
    required this.subtitle,
    required this.selected,
    required this.color,
    required this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color:
                disabled
                    ? Colors.white.withValues(alpha: 0.05)
                    : selected
                    ? color
                    : color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  disabled
                      ? Colors.transparent
                      : selected
                      ? color
                      : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: GoogleFonts.bubblerOne(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:
                      disabled
                          ? Colors.white24
                          : selected
                          ? Colors.black87
                          : Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.bubblerOne(
                  fontSize: 13,
                  color:
                      disabled
                          ? Colors.white24
                          : selected
                          ? Colors.black54
                          : Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
