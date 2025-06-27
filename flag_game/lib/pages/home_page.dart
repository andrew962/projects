// // import 'package:flag_game/pages/pages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../services/services.dart';

// // import '../config/routes/route.dart';

// class HomePage extends StatefulHookConsumerWidget {
//   const HomePage({super.key});
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends ConsumerState<HomePage> {
//   GameService gameService = GameService();

//   int bestScore = 0;
//   @override
//   void initState() {
//     super.initState();
//     getBestScore();
//   }

//   Future<SharedPreferences> sharedPreferences() async {
//     return await SharedPreferences.getInstance();
//   }

//   Future<void> getBestScore() async {
//     final prefs = await sharedPreferences();
//     var score = prefs.getInt("bestScore") ?? 0;
//     setState(() {
//       bestScore = score;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget title = Text(
//       'Mejor puntaje: $bestScore',
//       style: const TextStyle(
//         fontWeight: FontWeight.w900,
//         fontSize: 40,
//         color: Color(0xFF666870),
//         height: 0.9,
//         letterSpacing: -2,
//       ),
//     );
//     title = title
//         .animate(onPlay: (controller) => controller.repeat(reverse: true))
//         .saturate(delay: 500.milliseconds, duration: 500.milliseconds)
//         .then() // set baseline time to previous effect's end time
//         // .tint(color: const Color(0xFF80DDFF))
//         .then()
//         .blurXY(end: 1)
//         .fadeOut();

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: IconButton(
//                   onPressed: () {
//                     context.push('/settings');
//                   },
//                   icon: const FaIcon(
//                     FontAwesomeIcons.gear,
//                     size: 40,
//                   )),
//             )
//           ],
//         ),
//         Expanded(
//           child: Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               title,
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStatePropertyAll(Colors.grey[300])),
//                     onPressed: () {
//                       context.replace('/new-game');
//                     },
//                     child: const Text(
//                       "Juego Nuevo",
//                       style: TextStyle(color: Colors.black),
//                     )),
//               ),
//             ],
//           )),
//         ),
//       ],
//     );
//   }
// }
import 'package:animated_button/animated_button.dart';
import 'package:flag_game/widgets/animated_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                // Título del juego
                Text(
                  'Juego de Banderas',
                  style: GoogleFonts.bubblerOne(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Botón Jugar
                Row(
                  children: [
                    Expanded(
                      child: AnimatedButtonWidget(
                        label: 'Jugar',
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 25,
                        ),
                        color: const Color(0xFF5DA6A7),
                        onPressed: () {
                          context.replace('/new-game');
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Botón Configuraciones
                AnimatedButtonWidget(
                  label: 'Configuraciones',
                  icon: const Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  color: const Color(0xFFB5EAD7),
                  onPressed: () {
                    // TODO: abrir configuración
                  },
                ),

                const SizedBox(height: 20),

                // Botón Salir (opcional para Android)
                AnimatedButtonWidget(
                  label: 'Salir',
                  icon: const Icon(
                    Icons.exit_to_app,
                    size: 25,
                  ),
                  color: const Color(0xFFFFB5B5),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
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
                                SystemNavigator.pop();
                              },
                              child: Text(
                                'Si',
                                style: GoogleFonts.bubblerOne(
                                  // color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
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

class _MainButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _MainButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 6,
        ),
        icon: Icon(icon, size: 26),
        label: Text(label),
        onPressed: onPressed,
      ),
    );
  }
}
