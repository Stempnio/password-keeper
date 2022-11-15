import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:password_keeper/theme/theme.dart';

void main() {
  group("Theme cubit tests", () {
    test('initial theme mode is dark', () {
      var cubit = ThemeCubit();
      expect(ThemeState(brightness: ThemeBrightness.dark), cubit.state);
    });

    blocTest<ThemeCubit, ThemeState>(
      "toggling theme mode from initial (dark) changes theme mode to light",
      build: () => ThemeCubit(),
      act: (cubit) => cubit.toggleThemeMode(),
      expect: () => [const ThemeState(brightness: ThemeBrightness.light)],
    );

    blocTest<ThemeCubit, ThemeState>(
      "toggling theme mode twice changes theme mode back to dark",
      build: () => ThemeCubit(),
      act: (cubit) => cubit
        ..toggleThemeMode()
        ..toggleThemeMode(),
      expect: () => [
        const ThemeState(brightness: ThemeBrightness.light),
        const ThemeState(brightness: ThemeBrightness.dark),
      ],
    );
  });
}
