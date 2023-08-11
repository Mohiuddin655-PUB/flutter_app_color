part of '../app_color.dart';

class ThemeColorScheme<T extends ColorScheme> extends ColorScheme {
  final T light;
  final T dark;

  ThemeColorScheme({
    required this.light,
    T? dark,
  })  : dark = dark ?? light,
        super.light(
          /// PRIMARY
          primary: light.primary,
          primaryContainer: light.primaryContainer,
          onPrimary: light.onPrimary,
          onPrimaryContainer: light.onPrimaryContainer,
          inversePrimary: light.inversePrimary,

          /// SECONDARY
          secondary: light.secondary,
          secondaryContainer: light.secondaryContainer,
          onSecondary: light.onSecondary,
          onSecondaryContainer: light.onSecondaryContainer,

          /// TERNARY
          tertiary: light.tertiary,
          tertiaryContainer: light.tertiaryContainer,
          onTertiary: light.onTertiary,
          onTertiaryContainer: light.onTertiaryContainer,

          /// BACKGROUND
          background: light.background,
          onBackground: light.onBackground,

          /// ERROR
          error: light.error,
          errorContainer: light.errorContainer,
          onError: light.onError,
          onErrorContainer: light.onErrorContainer,

          /// OUTLINE
          outline: light.outline,
          outlineVariant: light.outlineVariant,

          /// SURFACE
          surface: light.surface,
          surfaceTint: light.surfaceTint,
          surfaceVariant: light.surfaceVariant,
          onSurface: light.onSurface,
          onSurfaceVariant: light.onSurfaceVariant,
          onInverseSurface: light.onInverseSurface,
          inverseSurface: light.inverseSurface,

          /// OTHERS
          brightness: light.brightness,
          scrim: light.scrim,
          shadow: light.shadow,
        );

  factory ThemeColorScheme.fromThemeColor({
    required ThemeColor primary,
    required ThemeColor secondary,
    required ThemeColor ternary,
    required ThemeColor background,
    required ThemeColor error,
  }) {
    return ThemeColorScheme(
      light: ColorScheme.light(
        primary: primary.light,
        secondary: secondary.light,
        tertiary: ternary.light,
        error: error.light,
        background: background.light,
      ) as T,
      dark: ColorScheme.dark(
        primary: primary.dark,
        secondary: secondary.dark,
        tertiary: ternary.dark,
        error: error.dark,
        background: background.dark,
      ) as T,
    );
  }

  T detect([bool darkMode = false]) => darkMode ? dark : light;
}
