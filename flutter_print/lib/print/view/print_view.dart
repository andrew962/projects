import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_print_string/print/cubit/print_cubit.dart';

class PrintView extends StatelessWidget {
  const PrintView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController(text: '');
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PrintCubit, String>(
            builder: (context, state) => Column(
                  children: [
                    Text(state),
                    TextField(
                      controller: textController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<PrintCubit>().print(textController.text);
                        },
                        child: const Text("Print"))
                  ],
                )));
  }
}
