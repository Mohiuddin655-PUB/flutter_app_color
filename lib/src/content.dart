part of 'theme.dart';

abstract class _Theme<T extends Object?> {
  final T? primary;
  final T? secondary;
  final T? tertiary;
  final T? error;
  final T? warning;
  final T? disable;
  final T? light;
  final T? lightAsFixed;
  final T? dark;
  final T? darkAsFixed;
  final T? mid;
  final T? holo;
  final T? soft;
  final T? deep;
  final T? optional;

  const _Theme({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.warning,
    this.disable,
    this.light,
    this.lightAsFixed,
    this.dark,
    this.darkAsFixed,
    this.mid,
    this.holo,
    this.soft,
    this.deep,
    this.optional,
  });

  _Theme<T> copy({
    final T? primary,
    final T? secondary,
    final T? tertiary,
    final T? error,
    final T? warning,
    final T? disable,
    final T? light,
    final T? lightAsFixed,
    final T? dark,
    final T? darkAsFixed,
    final T? mid,
    final T? holo,
    final T? soft,
    final T? deep,
    final T? optional,
  });

  _Theme<T> defaults({
    final T? primary,
    final T? secondary,
    final T? tertiary,
    final T? error,
    final T? warning,
    final T? disable,
    final T? light,
    final T? lightAsFixed,
    final T? dark,
    final T? darkAsFixed,
    final T? mid,
    final T? holo,
    final T? soft,
    final T? deep,
    final T? optional,
  });

  _Theme<T> x(_Theme<T>? parent);
}

class ThemeColors extends _Theme<Color> {
  const ThemeColors({
    super.primary,
    super.secondary,
    super.tertiary,
    super.error,
    super.warning,
    super.disable,
    super.light,
    super.lightAsFixed,
    super.dark,
    super.darkAsFixed,
    super.mid,
    super.holo,
    super.soft,
    super.deep,
    super.optional,
  });

  factory ThemeColors.of(String name, bool isDarkMode) {
    final x = ColorInitializer._i?._colors[name]?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeColors();
  }

  factory ThemeColors.baseOf(bool isDarkMode, ThemeData theme) {
    final x = _kDefault.detect(isDarkMode);
    return ThemeColors.of(_kBase, isDarkMode).defaults(
      primary: theme.colorScheme.primary,
      secondary: theme.colorScheme.secondary,
      tertiary: theme.colorScheme.tertiary,
      light: x.light,
      dark: x.dark,
      mid: x.mid,
      optional: x.optional,
      error: x.error,
    );
  }

  @override
  ThemeColors copy({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? disable,
    Color? light,
    Color? lightAsFixed,
    Color? dark,
    Color? darkAsFixed,
    Color? mid,
    Color? holo,
    Color? soft,
    Color? deep,
    Color? optional,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      disable: disable ?? this.disable,
      light: light ?? this.light,
      lightAsFixed: lightAsFixed ?? this.lightAsFixed,
      dark: dark ?? this.dark,
      darkAsFixed: darkAsFixed ?? this.darkAsFixed,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
      soft: soft ?? this.soft,
      deep: deep ?? this.deep,
      optional: optional ?? this.optional,
    );
  }

  @override
  ThemeColors defaults({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? disable,
    Color? light,
    Color? lightAsFixed,
    Color? dark,
    Color? darkAsFixed,
    Color? mid,
    Color? holo,
    Color? soft,
    Color? deep,
    Color? optional,
  }) {
    return ThemeColors(
      primary: this.primary ?? primary,
      secondary: this.secondary ?? secondary,
      tertiary: this.tertiary ?? tertiary,
      error: this.error ?? error,
      warning: this.warning ?? warning,
      disable: this.disable ?? disable,
      light: this.light ?? light,
      lightAsFixed: this.lightAsFixed ?? lightAsFixed,
      dark: this.dark ?? dark,
      darkAsFixed: this.darkAsFixed ?? darkAsFixed,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      soft: this.soft ?? soft,
      deep: this.deep ?? deep,
      optional: this.optional ?? optional,
    );
  }

  @override
  ThemeColors x(_Theme<Color>? parent) {
    return defaults(
      primary: parent?.primary,
      secondary: parent?.secondary,
      tertiary: parent?.tertiary,
      error: parent?.error,
      warning: parent?.warning,
      disable: parent?.disable,
      light: parent?.light,
      lightAsFixed: parent?.lightAsFixed,
      dark: parent?.dark,
      darkAsFixed: parent?.darkAsFixed,
      mid: parent?.mid,
      holo: parent?.holo,
      soft: parent?.soft,
      deep: parent?.deep,
      optional: parent?.optional,
    );
  }
}

class ThemeGradients extends _Theme<List<Color>> {
  const ThemeGradients({
    super.primary,
    super.secondary,
    super.tertiary,
    super.error,
    super.warning,
    super.disable,
    super.light,
    super.lightAsFixed,
    super.dark,
    super.darkAsFixed,
    super.mid,
    super.holo,
    super.soft,
    super.deep,
    super.optional,
  });

  factory ThemeGradients.of(String name, bool isDarkMode) {
    final x = ColorInitializer._i?._gradients[name]?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeGradients();
  }

  @override
  ThemeGradients copy({
    List<Color>? primary,
    List<Color>? secondary,
    List<Color>? tertiary,
    List<Color>? error,
    List<Color>? warning,
    List<Color>? disable,
    List<Color>? light,
    List<Color>? lightAsFixed,
    List<Color>? dark,
    List<Color>? darkAsFixed,
    List<Color>? mid,
    List<Color>? holo,
    List<Color>? soft,
    List<Color>? deep,
    List<Color>? optional,
  }) {
    return ThemeGradients(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      disable: disable ?? this.disable,
      light: light ?? this.light,
      lightAsFixed: lightAsFixed ?? this.lightAsFixed,
      dark: dark ?? this.dark,
      darkAsFixed: darkAsFixed ?? this.darkAsFixed,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
      soft: soft ?? this.soft,
      deep: deep ?? this.deep,
      optional: optional ?? this.optional,
    );
  }

  @override
  ThemeGradients defaults({
    List<Color>? primary,
    List<Color>? secondary,
    List<Color>? tertiary,
    List<Color>? error,
    List<Color>? warning,
    List<Color>? disable,
    List<Color>? light,
    List<Color>? lightAsFixed,
    List<Color>? dark,
    List<Color>? darkAsFixed,
    List<Color>? mid,
    List<Color>? holo,
    List<Color>? soft,
    List<Color>? deep,
    List<Color>? optional,
  }) {
    return ThemeGradients(
      primary: this.primary ?? primary,
      secondary: this.secondary ?? secondary,
      tertiary: this.tertiary ?? tertiary,
      error: this.error ?? error,
      warning: this.warning ?? warning,
      disable: this.disable ?? disable,
      light: this.light ?? light,
      lightAsFixed: this.lightAsFixed ?? lightAsFixed,
      dark: this.dark ?? dark,
      darkAsFixed: this.darkAsFixed ?? darkAsFixed,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      soft: this.soft ?? soft,
      deep: this.deep ?? deep,
      optional: this.optional ?? optional,
    );
  }

  @override
  ThemeGradients x(_Theme<List<Color>>? parent) {
    return defaults(
      primary: parent?.primary,
      secondary: parent?.secondary,
      tertiary: parent?.tertiary,
      error: parent?.error,
      warning: parent?.warning,
      disable: parent?.disable,
      light: parent?.light,
      lightAsFixed: parent?.lightAsFixed,
      dark: parent?.dark,
      darkAsFixed: parent?.darkAsFixed,
      mid: parent?.mid,
      holo: parent?.holo,
      soft: parent?.soft,
      deep: parent?.deep,
      optional: parent?.optional,
    );
  }
}
