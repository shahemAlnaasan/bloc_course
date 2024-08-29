import 'package:bloc_course/theme/app_theme.dart';
import 'package:bloc_course/theme/theme_bloc/bloc/theme_bloc.dart';
import 'package:bloc_course/theme/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView.builder(
        itemCount: AppTheme.values.length,
        itemBuilder: (context, i) {
          return Card(
            color: appThemeDate[AppTheme.values[i]]!.primaryColor,
            child: ListTile(
              leading: Text(
                AppTheme.values[i].name,
                style: appThemeDate[AppTheme.values[i]]!.textTheme.titleMedium,
              ),
              onTap: () {
                context
                    .read<ThemeCubit>()
                    .themeChanged(AppTheme.values[i].index);
              },
            ),
          );
        },
      ),
    );
  }
}
