import 'package:art_core/theme/theme_bloc/theme_event.dart';
import 'package:art_core/theme/theme_bloc/theme_state.dart';
import 'package:core/cache/preference_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final PreferenceManager preferenceManager;

  ThemeBloc(this.preferenceManager)
      : super(ThemeState(themeData: preferenceManager.isDarkMode() ? appThemeData[AppTheme.dark]! : appThemeData[AppTheme.light]!)) {
    on<ThemeChanged>(_changeTheme);
  }

  void _changeTheme(ThemeEvent event, Emitter<ThemeState> emit) {
    if (event is ThemeChanged) {
      preferenceManager.saveIsDarkMode(!preferenceManager.isDarkMode());
      print(preferenceManager.isDarkMode());
      emit(ThemeState(themeData: preferenceManager.isDarkMode() ? appThemeData[AppTheme.dark]! : appThemeData[AppTheme.light]!));
    }
  }
}
