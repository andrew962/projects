// import 'package:data/data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AnswersListWidgets extends ConsumerWidget {
//   final QuestionResponseModel question;
//   const AnswersListWidgets({super.key, required this.answers});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Column(
//       children: question.answers
//           .map((e) => Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                         onPressed: disableButtons
//                             ? null
//                             : () async {
//                                 loadingImg = true;
//                                 setState(() {
//                                   disableButtons = true;
//                                 });
//                                 String msg = "Correcto ";
//                                 if (!(e.id == question.correctAnswer)) {
//                                   setState(() {
//                                     lives = lives - 1;
//                                   });
//                                   if (lives < 1) {
//                                     msg = "Juego terminado";
//                                   } else {
//                                     msg = "Incorrecto era ";
//                                   }
//                                 } else {
//                                   setState(() {
//                                     goodAnswers = goodAnswers + 1;
//                                   });
//                                 }
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text(
//                                       '$msg${lives >= 1 ? question.country.countryName : ''}.',
//                                       style: const TextStyle(fontSize: 20),
//                                     ),
//                                     duration: const Duration(seconds: 3),
//                                   ),
//                                 );

//                                 await Future.delayed(
//                                     const Duration(milliseconds: 3500));
//                                 if (lives < 1) {
//                                   gameOver();
//                                 } else {
//                                   ref.invalidate(newQuestionProvider);
//                                   await Future.delayed(
//                                       const Duration(seconds: 1));
//                                   setState(() {
//                                     disableButtons = false;
//                                   });
//                                 }
//                               },
//                         child: Text(e.countryName)),
//                   ),
//                 ],
//               ))
//           .toList(),
//     );
//   }
// }
