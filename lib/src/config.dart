part of 'theme.dart';

class _ThemeConfig<T extends Object?> {
  final T light;
  final T dark;

  const _ThemeConfig({
    required this.light,
    T? dark,
  }) : dark = dark ?? light;

  T detect(bool darkMode) => darkMode ? dark : light;
}

class ColorThemeConfig extends _ThemeConfig<ThemeColors> {
  const ColorThemeConfig({
    required super.light,
    super.dark,
  });
}

class GradientThemeConfig extends _ThemeConfig<ThemeGradients> {
  const GradientThemeConfig({
    required super.light,
    super.dark,
  });
}

class _ThemeData<T extends Object?> {
  final String name;
  final T config;

  const _ThemeData({
    required this.name,
    required this.config,
  });
}

class ColorThemeData extends _ThemeData<ColorThemeConfig> {
  const ColorThemeData({
    required super.name,
    required super.config,
  });
}

class GradientThemeData extends _ThemeData<GradientThemeConfig> {
  const GradientThemeData({
    required super.name,
    required super.config,
  });
}
