part of 'theme.dart';

class _ThemeConfig<T extends _Theme?> {
  final T light;
  final T dark;

  const _ThemeConfig({
    required this.light,
    T? dark,
  }) : dark = dark ?? light;

  T detect(bool darkMode) => darkMode ? dark : light;

  Map<String, dynamic>? toMap() {
    final l = light?.toMap();
    final d = dark?.toMap();
    final x = {
      if (l != null && l.isNotEmpty) "light": l,
      if (d != null && d.isNotEmpty) "dark": d,
    };
    if (x.isEmpty) return null;
    return x;
  }
}

class ColorThemeConfig extends _ThemeConfig<ThemeColors> {
  const ColorThemeConfig({
    required super.light,
    super.dark,
  });

  static ColorThemeConfig? tryParse(Object? source) {
    if (source is String) source = jsonDecode(source);
    if (source is! Map) return null;
    final light = source['light'];
    final dark = source['dark'];
    return ColorThemeConfig(
      light: ThemeColors.parse(light),
      dark: ThemeColors.parse(dark),
    );
  }

  @override
  String toString() => "$ColorThemeConfig(${toMap()})";
}

class GradientThemeConfig extends _ThemeConfig<ThemeGradients> {
  const GradientThemeConfig({
    required super.light,
    super.dark,
  });

  static GradientThemeConfig? tryParse(Object? source) {
    if (source is String) source = jsonDecode(source);
    if (source is! Map) return null;
    final light = source['light'];
    final dark = source['dark'];
    return GradientThemeConfig(
      light: ThemeGradients.parse(light),
      dark: ThemeGradients.parse(dark),
    );
  }

  @override
  String toString() => "$GradientThemeConfig(${toMap()})";
}

class _ThemeData<T extends _ThemeConfig?> {
  final String name;
  final T config;

  const _ThemeData({
    required this.name,
    required this.config,
  });

  Map<String, dynamic>? toMap() {
    final c = config?.toMap();
    final x = {
      if (name.isNotEmpty) "name": name,
      if (c != null && c.isNotEmpty) "config": c,
    };
    if (x.isEmpty) return null;
    return x;
  }
}

class ColorThemeData extends _ThemeData<ColorThemeConfig> {
  const ColorThemeData({
    required super.name,
    required super.config,
  });

  static ColorThemeData? tryParse(Object? source) {
    if (source is String) source = jsonDecode(source);
    if (source is! Map) return null;
    final name = source['name'];
    final parsedName = name is String ? name : null;
    if (parsedName == null || parsedName.isEmpty) return null;
    final config = source['config'];
    final parsedConfig = ColorThemeConfig.tryParse(config);
    if (parsedConfig == null) return null;
    return ColorThemeData(name: parsedName, config: parsedConfig);
  }

  @override
  String toString() => "$ColorThemeData(${toMap()})";
}

class GradientThemeData extends _ThemeData<GradientThemeConfig> {
  const GradientThemeData({
    required super.name,
    required super.config,
  });

  static GradientThemeData? tryParse(Object? source) {
    if (source is String) source = jsonDecode(source);
    if (source is! Map) return null;
    final name = source['name'];
    final parsedName = name is String ? name : null;
    if (parsedName == null || parsedName.isEmpty) return null;
    final config = source['config'];
    final parsedConfig = GradientThemeConfig.tryParse(config);
    if (parsedConfig == null) return null;
    return GradientThemeData(name: parsedName, config: parsedConfig);
  }

  @override
  String toString() => "$GradientThemeData(${toMap()})";
}
