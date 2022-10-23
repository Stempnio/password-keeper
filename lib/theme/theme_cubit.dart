import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.dark));

  bool _isDark = true;

  bool get isDark => _isDark;

  void toggleThemeMode() {
    _isDark = !_isDark;
    emit(isDark
        ? ThemeState(themeMode: ThemeMode.dark)
        : ThemeState(themeMode: ThemeMode.light));
  }
}
