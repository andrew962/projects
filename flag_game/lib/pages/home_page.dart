import 'package:animated_button/animated_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:curved_text/curved_text.dart';
import 'package:flag_game/providers/providers.dart';
import 'package:flag_game/widgets/animated_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final playerPopUp = AudioPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    playerPopUp.dispose();
    super.dispose();
  }

  void soundTap() async {
    if (!ref.read(settingsProvider).soundEnabled) return;
    if (playerPopUp.state != PlayerState.playing) {
      await playerPopUp.play(AssetSource('sounds/pop_up.mp3'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE0C9), // Fondo pastel claro
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/flag.svg',
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      height: 150,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: CurvedText(
                          curvature: 0.002,
                          text: 'Juego de Banderas',
                          textStyle: GoogleFonts.bubblerOne(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Título del juego
                const SizedBox(height: 40),
                // Botón Jugar
                Row(
                  children: [
                    Expanded(
                      child: AnimatedButtonWidget(
                        label: 'Jugar',
                        icon: const Icon(Icons.play_arrow, size: 25),
                        color: const Color(0xFF5DA6A7),
                        onPressed: () {
                          soundTap();
                          context.push('/new-game');
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Botón Configuraciones
                AnimatedButtonWidget(
                  label: 'Configuraciones',
                  icon: const Icon(Icons.settings, size: 25),
                  color: const Color(0xFFB5EAD7),
                  onPressed: () {
                    soundTap();
                    context.push('/settings');
                  },
                ),

                const SizedBox(height: 20),

                // Botón Salir (opcional para Android)
                AnimatedButtonWidget(
                  label: 'Salir',
                  icon: const Icon(Icons.exit_to_app, size: 25),
                  color: const Color(0xFFFFB5B5),
                  onPressed: () {
                    soundTap();
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            backgroundColor: const Color(0xFFFFB5B5),
                            title: Text(
                              'Desea salir?',
                              style: GoogleFonts.bubblerOne(
                                // color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: [
                              AnimatedButton(
                                width: 50,
                                height: 50,
                                onPressed: () {
                                  soundTap();
                                  SystemNavigator.pop();
                                },
                                child: Text(
                                  'Si',
                                  style: GoogleFonts.bubblerOne(
                                    // color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
