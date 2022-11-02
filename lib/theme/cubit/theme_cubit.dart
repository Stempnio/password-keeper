import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(brightness: ThemeBrightness.dark));

  bool _isDark = true;

  bool get isDark => _isDark;

  void toggleThemeMode() {
    _isDark = !_isDark;
    emit(isDark
        ? const ThemeState(brightness: ThemeBrightness.dark)
        : const ThemeState(brightness: ThemeBrightness.light));
  }
}
