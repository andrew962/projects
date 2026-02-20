import 'package:flag_game/widgets/animated_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  final int score;
  final int bestScore;
  final bool isNewRecord;
  final int correctAnswers;
  final int totalQuestions;
  final int maxStreak;
  final int livesRemaining;
  final int totalLives;

  const ResultsPage({
    super.key,
    required this.score,
    required this.bestScore,
    required this.isNewRecord,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.maxStreak,
    required this.livesRemaining,
    required this.totalLives,
  });

  Widget _statChip(IconData icon, String value, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 2),
        Text(
          value,
          style: GoogleFonts.bubblerOne(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.bubblerOne(fontSize: 11, color: Colors.white70),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5DA6A7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              if (isNewRecord) ...[
                const Icon(Icons.emoji_events, color: Colors.amber, size: 72)
                    .animate()
                    .scale(
                      begin: const Offset(0, 0),
                      duration: 600.ms,
                      curve: Curves.elasticOut,
                    )
                    .fadeIn(duration: 300.ms),
                const SizedBox(height: 8),
                Text(
                  '¡Nuevo Récord!',
                  style: GoogleFonts.bubblerOne(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 300.ms)
                    .slideY(begin: 0.3, end: 0, duration: 300.ms),
                const SizedBox(height: 24),
              ] else ...[
                const Icon(Icons.flag_circle, color: Colors.white54, size: 72)
                    .animate()
                    .scale(
                      begin: const Offset(0, 0),
                      duration: 600.ms,
                      curve: Curves.elasticOut,
                    )
                    .fadeIn(duration: 300.ms),
                const SizedBox(height: 24),
              ],
              Text(
                'Partida terminada',
                style: GoogleFonts.bubblerOne(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ).animate(delay: 100.ms).fadeIn(duration: 300.ms),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      '$score',
                      style: GoogleFonts.bubblerOne(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1,
                      ),
                    )
                        .animate(delay: 150.ms)
                        .scale(
                          begin: const Offset(0.3, 0.3),
                          duration: 500.ms,
                          curve: Curves.elasticOut,
                        )
                        .fadeIn(duration: 300.ms),
                    Text(
                      'puntos totales',
                      style: GoogleFonts.bubblerOne(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.white.withValues(alpha: 0.3)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _statChip(
                          Icons.check_circle_outline,
                          '$correctAnswers/$totalQuestions',
                          'aciertos',
                          Colors.green[300]!,
                        ),
                        Container(height: 40, width: 1, color: Colors.white24),
                        _statChip(
                          Icons.local_fire_department,
                          'x$maxStreak',
                          'racha máx.',
                          maxStreak >= 5 ? Colors.orange[300]! : Colors.white70,
                        ),
                        Container(height: 40, width: 1, color: Colors.white24),
                        _statChip(
                          Icons.favorite,
                          '$livesRemaining/$totalLives',
                          'vidas',
                          Colors.red[300]!,
                        ),
                      ],
                    ).animate(delay: 200.ms).fadeIn(duration: 400.ms).slideY(
                          begin: 0.2,
                          end: 0,
                          duration: 400.ms,
                          curve: Curves.easeOut,
                        ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.white.withValues(alpha: 0.3)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.emoji_events,
                            color: Colors.amber, size: 20),
                        const SizedBox(width: 6),
                        Text(
                          'Récord: $bestScore',
                          style: GoogleFonts.bubblerOne(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
                  .animate(delay: 100.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOut),
              const Spacer(),
              AnimatedButtonWidget(
                onPressed: () => context.go('/new-game'),
                label: 'Jugar de nuevo',
                color: const Color(0xFFB8E2C8),
              )
                  .animate(delay: 300.ms)
                  .slideY(begin: 0.5, end: 0, duration: 280.ms, curve: Curves.easeOut)
                  .fadeIn(duration: 220.ms),
              const SizedBox(height: 16),
              AnimatedButtonWidget(
                onPressed: () => context.go('/'),
                label: 'Menú Principal',
                color: const Color(0xFFFFB5B5),
              )
                  .animate(delay: 400.ms)
                  .slideY(begin: 0.5, end: 0, duration: 280.ms, curve: Curves.easeOut)
                  .fadeIn(duration: 220.ms),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
