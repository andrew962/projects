import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_print_string/print/cubit/print_cubit.dart';
import 'package:flutter_print_string/print/view/print_view.dart';

class PrintPage extends StatelessWidget {
  const PrintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PrintCubit(),
      child: const PrintView(),
    );
  }
}
