part of "theme.dart";

extension ColorThemeHelper on BuildContext {
  // THEME

  ThemeData get _t => Theme.of(this);

  bool get isDarkMode => ColorTheme.isDarkMode(this);

  ColorData get color => ColorData.from(this);

  Color get green => color.green;

  Color get blue => color.blue;

  Color get red => color.red;

  Color get orange => color.orange;

  Color get yellow => color.yellow;

  Color get purple => color.purple;

  Color get pink => color.pink;

  ThemeColors colorOf(String name) => color.colorOf(name);

  ThemeGradients gradientOf(String name) => color.gradientOf(name);

  // BASE COLORS

  ThemeColors get base => color.base;

  Color get primary => base.primary ?? _t.primaryColor;

  Color get secondary => base.secondary ?? _t.colorScheme.secondary;

  Color get tertiary => base.tertiary ?? _t.colorScheme.tertiary;

  Color? get light => base.light;

  Color? get lightAsFixed => base.lightAsFixed;

  Color? get dark => base.dark;

  Color? get darkAsFixed => base.darkAsFixed;

  Color? get mid => base.mid;

  Color? get holo => base.holo;

  Color? get soft => base.soft;

  Color? get deep => base.deep;

  Color? get disable => base.disable;

  Color? get error => base.error;

  Color? get warning => base.warning;

  Color? get optional => base.optional;

  // COLORS
  ThemeColors get appbarColor => color.appbar;

  ThemeColors get backgroundColor => color.background;

  ThemeColors get bottomColor => color.bottom;

  ThemeColors get cardColor => color.card;

  ThemeColors get dialogColor => color.dialog;

  ThemeColors get dividerColor => color.divider;

  ThemeColors get highlightColor => color.highlight;

  ThemeColors get hintColor => color.hint;

  ThemeColors get hoverColor => color.hover;

  ThemeColors get iconColor => color.icon;

  ThemeColors get labelColor => color.label;

  ThemeColors get placeholder => color.placeholder;

  ThemeColors get scaffoldColor => color.scaffold;

  ThemeColors get shadowColor => color.shadow;

  ThemeColors get splashColor => color.splash;

  ThemeColors get surfaceColor => color.surface;

  ThemeColors get textColor => color.text;

  // GRADIENTS
  ThemeGradients get baseGradient => color.baseGradient;

  ThemeGradients get appbarGradient => color.appbarGradient;

  ThemeGradients get backgroundGradient => color.backgroundGradient;

  ThemeGradients get cardGradient => color.cardGradient;

  ThemeGradients get bottomGradient => color.bottomGradient;

  ThemeGradients get dialogGradient => color.dialogGradient;

  ThemeGradients get dividerGradient => color.dividerGradient;

  ThemeGradients get highlightGradient => color.highlightGradient;

  ThemeGradients get hintGradient => color.hintGradient;

  ThemeGradients get hoverGradient => color.hoverGradient;

  ThemeGradients get iconGradient => color.iconGradient;

  ThemeGradients get labelGradient => color.labelGradient;

  ThemeGradients get placeholderGradient => color.placeholderGradient;

  ThemeGradients get scaffoldGradient => color.scaffoldGradient;

  ThemeGradients get shadowGradient => color.shadowGradient;

  ThemeGradients get splashGradient => color.splashGradient;

  ThemeGradients get surfaceGradient => color.surfaceGradient;

  ThemeGradients get textGradient => color.textGradient;
}
