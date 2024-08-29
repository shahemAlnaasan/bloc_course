import 'package:bloc/bloc.dart';
import 'package:bloc_course/theme/app_theme.dart';
import 'package:bloc_course/theme/theme_cache.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        final int themeIndex = await ThemeCache().getThemeIndex();
        final theme = AppTheme.values
            .firstWhere((appTheme) => appTheme.index == themeIndex);
        emit(LoadedThemeState(themeData: appThemeDate[theme]!));
      } else if (event is ThemeChangedEvent) {
        final themeIndex = event.theme.index;
        await ThemeCache().storeThemeIndex(themeIndex);
        emit(LoadedThemeState(themeData: appThemeDate[event.theme]!));
      }
    });
  }
}
