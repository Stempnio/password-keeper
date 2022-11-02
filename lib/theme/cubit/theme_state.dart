part of 'theme_cubit.dart';

enum ThemeBrightness {
  light,
  dark,
}

class ThemeState extends Equatable {
  const ThemeState({required this.brightness});

  final ThemeBrightness brightness;

  @override
  List<Object?> get props => [brightness];
}
