import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedButtonWidget extends ConsumerWidget {
  final Function() onPressed;
  final String label;
  final Color color;
  final bool enabled;
  final Icon? icon;

  const AnimatedButtonWidget(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.color,
      this.enabled = true,
      this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedButton(
      onPressed: onPressed,
      color: color,
      enabled: enabled,
      // disabledColor: Colors.grey,
      // shadowDegree: ShadowDegree.light,
      // borderRadius: 8,
      duration: 85,
      height: 70,
      width: MediaQuery.of(context).size.width - 50,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Visibility(visible: icon != null, child: icon ?? Container()),
          Text(
            label,
            style: GoogleFonts.bubblerOne(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
