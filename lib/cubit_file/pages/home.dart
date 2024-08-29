// import 'package:bloc_course/bloc_file/internet_bloc/bloc/internet_bloc.dart';
import 'package:bloc_course/cubit_file/internet_cubit/cubit/internet_cubit.dart';
import 'package:bloc_course/theme/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is NotConnectedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Connected"),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is ConnectedState) {
                return Center(
                  child: Column(
                    children: [Text(state.message)],
                  ),
                );
              } else if (state is NotConnectedState) {
                return Center(
                  child: Column(
                    children: [Text(state.message)],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          MaterialButton(
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.clear();
            },
            child: Text("clean shared"),
          )
        ],
      ),
    );
  }
}
