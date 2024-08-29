import 'package:bloc/bloc.dart';
import 'package:bloc_course/theme/app_theme.dart';
import 'package:bloc_course/theme/theme_cache.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void getCurrentTheme() async {
    final int themeIndex = await ThemeCache().getThemeIndex();
    final theme =
        AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);
    emit(LoadedThemeState(themeData: appThemeDate[theme]!));
  }

  void themeChanged(int themeIndex) {
    ThemeCache().storeThemeIndex(themeIndex);
    emit(LoadedThemeState(
        themeData: appThemeDate[AppTheme.values[themeIndex]]!));
  }
}
