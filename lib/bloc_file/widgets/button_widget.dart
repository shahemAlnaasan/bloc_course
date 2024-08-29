import 'package:bloc_course/bloc_file/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(ResetEvent());
          },
          child: const Text("0"),
        ),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(DecrementEventv());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
