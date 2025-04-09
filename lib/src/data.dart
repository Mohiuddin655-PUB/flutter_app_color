part of 'theme.dart';

final class ColorData {
  // Theme Mode
  final bool isDarkMode;

  // Theme Colors
  final Color green;
  final Color blue;
  final Color red;
  final Color orange;
  final Color yellow;
  final Color purple;
  final Color pink;

  // Color Theme Configs
  final ThemeColors appbar;
  final ThemeColors base;
  final ThemeColors background;
  final ThemeColors bottom;
  final ThemeColors card;
  final ThemeColors dialog;
  final ThemeColors divider;
  final ThemeColors highlight;
  final ThemeColors hint;
  final ThemeColors hover;
  final ThemeColors icon;
  final ThemeColors label;
  final ThemeColors placeholder;
  final ThemeColors scaffold;
  final ThemeColors shadow;
  final ThemeColors splash;
  final ThemeColors surface;
  final ThemeColors text;
  final Map<String, ThemeColors> colors;

  // Gradient Theme Configs
  final ThemeGradients appbarGradient;
  final ThemeGradients baseGradient;
  final ThemeGradients backgroundGradient;
  final ThemeGradients bottomGradient;
  final ThemeGradients cardGradient;
  final ThemeGradients dialogGradient;
  final ThemeGradients dividerGradient;
  final ThemeGradients highlightGradient;
  final ThemeGradients hintGradient;
  final ThemeGradients hoverGradient;
  final ThemeGradients iconGradient;
  final ThemeGradients labelGradient;
  final ThemeGradients placeholderGradient;
  final ThemeGradients scaffoldGradient;
  final ThemeGradients shadowGradient;
  final ThemeGradients splashGradient;
  final ThemeGradients surfaceGradient;
  final ThemeGradients textGradient;
  final Map<String, ThemeGradients> gradients;

  const ColorData._({
    required this.isDarkMode,
    required this.green,
    required this.blue,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.purple,
    required this.pink,
    required this.appbar,
    required this.base,
    required this.background,
    required this.bottom,
    required this.card,
    required this.dialog,
    required this.divider,
    required this.highlight,
    required this.hint,
    required this.hover,
    required this.icon,
    required this.label,
    required this.placeholder,
    required this.scaffold,
    required this.shadow,
    required this.splash,
    required this.surface,
    required this.text,
    required this.colors,
    required this.appbarGradient,
    required this.baseGradient,
    required this.backgroundGradient,
    required this.bottomGradient,
    required this.cardGradient,
    required this.dialogGradient,
    required this.dividerGradient,
    required this.highlightGradient,
    required this.hintGradient,
    required this.hoverGradient,
    required this.iconGradient,
    required this.labelGradient,
    required this.placeholderGradient,
    required this.scaffoldGradient,
    required this.shadowGradient,
    required this.splashGradient,
    required this.surfaceGradient,
    required this.textGradient,
    required this.gradients,
  });

  factory ColorData.of(bool dark, [ThemeData? theme]) {
    theme ??= ThemeData();

    final base = ThemeColors.baseOf(dark, theme);

    final x = ColorInitializer._i?._customs.entries.map((e) {
      if (e.value == null) return null;
      return MapEntry(e.key, e.value!.detect(dark).x(base));
    }).whereType<MapEntry<String, ThemeColors>>();

    Map<String, ThemeColors> colors =
        x == null || x.isEmpty ? {} : Map.fromEntries(x);

    final y = ColorInitializer._i?._customGradients.entries.map((e) {
      if (e.value == null) return null;
      return MapEntry(e.key, e.value!.detect(dark));
    }).whereType<MapEntry<String, ThemeGradients>>();

    Map<String, ThemeGradients> gradients =
        y == null || y.isEmpty ? {} : Map.fromEntries(y);

    return ColorData._(
      isDarkMode: dark,
      green: ColorInitializer.greenOf(dark),
      blue: ColorInitializer.blueOf(dark),
      red: ColorInitializer.redOf(dark),
      orange: ColorInitializer.orangeOf(dark),
      yellow: ColorInitializer.yellowOf(dark),
      purple: ColorInitializer.purpleOf(dark),
      pink: ColorInitializer.pinkOf(dark),
      appbar: ThemeColors.of(_kAppbar, dark).defaults(
        primary: theme.appBarTheme.backgroundColor,
      ),
      base: base,
      background: ThemeColors.of(_kBackground, dark).defaults(
        primary: theme.scaffoldBackgroundColor,
      ),
      bottom: ThemeColors.of(_kBottom, dark).defaults(
        primary: theme.bottomAppBarTheme.color,
      ),
      card: ThemeColors.of(_kCard, dark).defaults(
        primary: theme.cardTheme.color ?? theme.cardColor,
      ),
      dialog: ThemeColors.of(_kDialog, dark).defaults(
        primary: theme.dialogTheme.backgroundColor,
      ),
      divider: ThemeColors.of(_kDivider, dark).defaults(
        primary: theme.dividerColor,
      ),
      highlight: ThemeColors.of(_kHighlight, dark).defaults(
        primary: theme.highlightColor,
      ),
      hint: ThemeColors.of(_kHint, dark).defaults(primary: theme.hintColor),
      hover: ThemeColors.of(_kHover, dark).defaults(primary: theme.hoverColor),
      icon: ThemeColors.of(_kIcon, dark).defaults(
        primary: theme.iconTheme.color,
      ),
      label: ThemeColors.of(_kLabel, dark),
      placeholder: ThemeColors.of(_kPlaceholder, dark),
      scaffold: ThemeColors.of(_kScaffold, dark).defaults(
        primary: theme.scaffoldBackgroundColor,
      ),
      shadow: ThemeColors.of(_kShadow, dark).defaults(
        primary: theme.shadowColor,
      ),
      surface: ThemeColors.of(_kSurface, dark).defaults(
        primary: theme.colorScheme.surface,
      ),
      splash: ThemeColors.of(_kSplash, dark).defaults(
        primary: theme.splashColor,
      ),
      text: ThemeColors.of(_kText, dark).defaults(
        primary: theme.textTheme.bodyMedium?.color,
        secondary: theme.textTheme.bodySmall?.color,
        tertiary: theme.textTheme.bodyLarge?.color,
      ),
      colors: colors,
      appbarGradient: ThemeGradients.of(_kAppbar, dark),
      baseGradient: ThemeGradients.of(_kBase, dark),
      backgroundGradient: ThemeGradients.of(_kBackground, dark),
      bottomGradient: ThemeGradients.of(_kBottom, dark),
      cardGradient: ThemeGradients.of(_kCard, dark),
      dialogGradient: ThemeGradients.of(_kDialog, dark),
      dividerGradient: ThemeGradients.of(_kDivider, dark),
      highlightGradient: ThemeGradients.of(_kHighlight, dark),
      hintGradient: ThemeGradients.of(_kHint, dark),
      hoverGradient: ThemeGradients.of(_kHover, dark),
      iconGradient: ThemeGradients.of(_kIcon, dark),
      labelGradient: ThemeGradients.of(_kLabel, dark),
      placeholderGradient: ThemeGradients.of(_kPlaceholder, dark),
      scaffoldGradient: ThemeGradients.of(_kScaffold, dark),
      shadowGradient: ThemeGradients.of(_kShadow, dark),
      splashGradient: ThemeGradients.of(_kSplash, dark),
      surfaceGradient: ThemeGradients.of(_kSurface, dark),
      textGradient: ThemeGradients.of(_kText, dark),
      gradients: gradients,
    );
  }

  factory ColorData.from(BuildContext context) {
    return ColorData.of(
        ColorInitializer.isDarkMode(context), Theme.of(context));
  }

  static ColorData get light => ColorData.of(false);

  static ColorData get dark => ColorData.of(true);

  ThemeColors colorOf(String name) => colors[name] ?? ThemeColors();

  ThemeGradients gradientOf(String name) => gradients[name] ?? ThemeGradients();
}
