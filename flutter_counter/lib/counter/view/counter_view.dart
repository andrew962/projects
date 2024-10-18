import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) => Text(
              '$state',
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                key: const Key('counter_view_floating_button_increment'),
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment()),
            const SizedBox(height: 8),
            FloatingActionButton(
                key: const Key('counter_view_floating_button_decrement'),
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement())
          ],
        ),
      ),
    );
  }
}
