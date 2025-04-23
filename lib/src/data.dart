part of 'theme.dart';

final class ColorData {
  // Theme Mode
  final bool isDarkMode;

  // Theme Colors
  final Color green;
  final Color grey;
  final Color blue;
  final Color red;
  final Color orange;
  final Color yellow;
  final Color purple;
  final Color pink;

  // Color Theme Configs
  final ThemeColors? _appbar;

  ThemeColors get appbar => _appbar ?? base;

  final ThemeColors? _base;

  ThemeColors get base => _base ?? ThemeColors();

  final ThemeColors? _background;

  ThemeColors get background => _background ?? base;

  final ThemeColors? _bottom;

  ThemeColors get bottom => _bottom ?? base;

  final ThemeColors? _card;

  ThemeColors get card => _card ?? base;

  final ThemeColors? _dialog;

  ThemeColors get dialog => _dialog ?? base;

  final ThemeColors? _divider;

  ThemeColors get divider => _divider ?? base;

  final ThemeColors? _highlight;

  ThemeColors get highlight => _highlight ?? base;

  final ThemeColors? _hint;

  ThemeColors get hint => _hint ?? base;

  final ThemeColors? _hover;

  ThemeColors get hover => _hover ?? base;

  final ThemeColors? _icon;

  ThemeColors get icon => _icon ?? base;

  final ThemeColors? _label;

  ThemeColors get label => _label ?? base;

  final ThemeColors? _placeholder;

  ThemeColors get placeholder => _placeholder ?? base;

  final ThemeColors? _scaffold;

  ThemeColors get scaffold => _scaffold ?? base;

  final ThemeColors? _shadow;

  ThemeColors get shadow => _shadow ?? base;

  final ThemeColors? _splash;

  ThemeColors get splash => _splash ?? base;

  final ThemeColors? _surface;

  ThemeColors get surface => _surface ?? base;

  final ThemeColors? _text;

  ThemeColors get text => _text ?? base;

  final Map<String, ThemeColors> colors;

  final Map<String, ThemeGradients> gradients;

  const ColorData._({
    required this.isDarkMode,
    required this.green,
    required this.grey,
    required this.blue,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.purple,
    required this.pink,
    required ThemeColors appbar,
    required ThemeColors base,
    required ThemeColors background,
    required ThemeColors bottom,
    required ThemeColors card,
    required ThemeColors dialog,
    required ThemeColors divider,
    required ThemeColors highlight,
    required ThemeColors hint,
    required ThemeColors hover,
    required ThemeColors icon,
    required ThemeColors label,
    required ThemeColors placeholder,
    required ThemeColors scaffold,
    required ThemeColors shadow,
    required ThemeColors splash,
    required ThemeColors surface,
    required ThemeColors text,
    required this.colors,
    required this.gradients,
  })  : _appbar = appbar,
        _base = base,
        _background = background,
        _bottom = bottom,
        _card = card,
        _dialog = dialog,
        _divider = divider,
        _highlight = highlight,
        _hint = hint,
        _hover = hover,
        _icon = icon,
        _label = label,
        _placeholder = placeholder,
        _scaffold = scaffold,
        _shadow = shadow,
        _splash = splash,
        _surface = surface,
        _text = text;

  factory ColorData.of(bool dark, [ThemeData? theme]) {
    theme ??= ThemeData();

    final base = ThemeColors.baseOf(dark, theme);

    final x = ColorTheme._i?._customs.entries.map((e) {
      if (e.value == null) return null;
      return MapEntry(e.key, e.value!.detect(dark));
    }).whereType<MapEntry<String, ThemeColors>>();

    Map<String, ThemeColors> colors =
        x == null || x.isEmpty ? {} : Map.fromEntries(x);

    final y = ColorTheme._i?._gradients.entries.map((e) {
      if (e.value == null) return null;
      return MapEntry(e.key, e.value!.detect(dark));
    }).whereType<MapEntry<String, ThemeGradients>>();

    Map<String, ThemeGradients> gradients =
        y == null || y.isEmpty ? {} : Map.fromEntries(y);

    return ColorData._(
      isDarkMode: dark,
      green: ColorTheme.greenOf(dark),
      grey: ColorTheme.greyOf(dark),
      blue: ColorTheme.blueOf(dark),
      red: ColorTheme.redOf(dark),
      orange: ColorTheme.orangeOf(dark),
      yellow: ColorTheme.yellowOf(dark),
      purple: ColorTheme.purpleOf(dark),
      pink: ColorTheme.pinkOf(dark),
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
      gradients: gradients,
    );
  }

  factory ColorData.from(BuildContext context) {
    return ColorData.of(ColorTheme.isDarkMode(context), Theme.of(context));
  }

  static ColorData get light => ColorData.of(false);

  static ColorData get dark => ColorData.of(true);

  ThemeColors colorOf(String name) => colors[name] ?? ThemeColors();

  ThemeGradients gradientOf(String name) => gradients[name] ?? ThemeGradients();
}
