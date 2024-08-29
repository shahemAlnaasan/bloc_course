import 'package:bloc_course/bloc_file/bloc/counter_bloc.dart';
import 'package:bloc_course/bloc_file/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Bloc"),
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Counter value is:"),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterInitial) {
                    return const Text(
                      "0",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    );
                  } else if (state is CounterValueChangedState) {
                    return Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: const ButtonsWidget());
  }
}
