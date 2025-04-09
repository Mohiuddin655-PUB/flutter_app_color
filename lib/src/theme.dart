import 'package:flutter/material.dart';

import 'theme_color.dart';

part 'config.dart';
part 'content.dart';
part 'context.dart';
part 'data.dart';
part 'defaults.dart';
part 'keys.dart';
part 'types.dart';

class ColorInitializer {
  final ThemeMode? _themeMode;
  final ThemeColor _green;
  final ThemeColor _blue;
  final ThemeColor _red;
  final ThemeColor _orange;
  final ThemeColor _yellow;
  final ThemeColor _purple;
  final ThemeColor _pink;
  final _Colors _colors = {_kBase: _kDefault};
  final _Colors _customs = {};
  final _Gradients _gradients = {};
  final _Gradients _customGradients = {};

  ColorInitializer({
    ThemeMode? themeMode,
    ThemeColor? green,
    ThemeColor? blue,
    ThemeColor? red,
    ThemeColor? orange,
    ThemeColor? yellow,
    ThemeColor? purple,
    ThemeColor? pink,
    // COLORS
    ColorThemeConfig? appbar,
    ColorThemeConfig? base,
    ColorThemeConfig? background,
    ColorThemeConfig? bottom,
    ColorThemeConfig? card,
    ColorThemeConfig? dialog,
    ColorThemeConfig? divider,
    ColorThemeConfig? highlight,
    ColorThemeConfig? hint,
    ColorThemeConfig? hover,
    ColorThemeConfig? icon,
    ColorThemeConfig? label,
    ColorThemeConfig? placeholder,
    ColorThemeConfig? scaffold,
    ColorThemeConfig? shadow,
    ColorThemeConfig? splash,
    ColorThemeConfig? surface,
    ColorThemeConfig? text,
    Iterable<ColorThemeData> colors = const [],
    // GRADIENTS
    GradientThemeConfig? appbarGradient,
    GradientThemeConfig? baseGradient,
    GradientThemeConfig? backgroundGradient,
    GradientThemeConfig? bottomGradient,
    GradientThemeConfig? cardGradient,
    GradientThemeConfig? dialogGradient,
    GradientThemeConfig? dividerGradient,
    GradientThemeConfig? highlightGradient,
    GradientThemeConfig? hintGradient,
    GradientThemeConfig? hoverGradient,
    GradientThemeConfig? iconGradient,
    GradientThemeConfig? labelGradient,
    GradientThemeConfig? placeholderGradient,
    GradientThemeConfig? scaffoldGradient,
    GradientThemeConfig? shadowGradient,
    GradientThemeConfig? splashGradient,
    GradientThemeConfig? surfaceGradient,
    GradientThemeConfig? textGradient,
    Iterable<GradientThemeData> gradients = const [],
  })  : _themeMode = themeMode,
        _green = kGreen,
        _blue = kBlue,
        _red = kRed,
        _orange = kOrange,
        _yellow = kYellow,
        _purple = kPurple,
        _pink = kPink {
    // COLORS
    if (appbar != null) _colors[_kAppbar] = appbar;
    if (base != null) _colors[_kBase] = base;
    if (background != null) _colors[_kBackground] = background;
    if (bottom != null) _colors[_kBottom] = bottom;
    if (card != null) _colors[_kCard] = card;
    if (dialog != null) _colors[_kDialog] = dialog;
    if (divider != null) _colors[_kDivider] = divider;
    if (highlight != null) _colors[_kHighlight] = highlight;
    if (hint != null) _colors[_kHint] = hint;
    if (hover != null) _colors[_kHover] = hover;
    if (icon != null) _colors[_kIcon] = icon;
    if (label != null) _colors[_kLabel] = label;
    if (placeholder != null) _colors[_kPlaceholder] = placeholder;
    if (scaffold != null) _colors[_kScaffold] = scaffold;
    if (shadow != null) _colors[_kShadow] = shadow;
    if (splash != null) _colors[_kSplash] = splash;
    if (surface != null) _colors[_kSurface] = surface;
    if (text != null) _colors[_kText] = text;
    if (colors.isNotEmpty) {
      _customs.addEntries(colors.map((e) => MapEntry(e.name, e.config)));
    }
    // GRADIENTS
    if (appbarGradient != null) _gradients[_kAppbar] = appbarGradient;
    if (baseGradient != null) _gradients[_kBase] = baseGradient;
    if (backgroundGradient != null) {
      _gradients[_kBackground] = backgroundGradient;
    }
    if (bottomGradient != null) _gradients[_kBottom] = bottomGradient;
    if (cardGradient != null) _gradients[_kCard] = cardGradient;
    if (dialogGradient != null) _gradients[_kDialog] = dialogGradient;
    if (dividerGradient != null) _gradients[_kDivider] = dividerGradient;
    if (highlightGradient != null) _gradients[_kHighlight] = highlightGradient;
    if (hintGradient != null) _gradients[_kHint] = hintGradient;
    if (hoverGradient != null) _gradients[_kHover] = hoverGradient;
    if (iconGradient != null) _gradients[_kIcon] = iconGradient;
    if (labelGradient != null) _gradients[_kLabel] = labelGradient;
    if (placeholderGradient != null) {
      _gradients[_kPlaceholder] = placeholderGradient;
    }
    if (scaffoldGradient != null) _gradients[_kScaffold] = scaffoldGradient;
    if (shadowGradient != null) _gradients[_kShadow] = shadowGradient;
    if (splashGradient != null) _gradients[_kSplash] = splashGradient;
    if (surfaceGradient != null) _gradients[_kSurface] = surfaceGradient;
    if (textGradient != null) _gradients[_kText] = textGradient;
    if (gradients.isNotEmpty) {
      _customGradients.addEntries(gradients.map((e) {
        return MapEntry(e.name, e.config);
      }));
    }
  }

  void createInstance() => _i = this;

  static ColorInitializer? _i;

  static ColorInitializer get i {
    if (_i != null) {
      return _i!;
    } else {
      throw UnimplementedError("$ColorInitializer not initialized yet!");
    }
  }

  static bool isDarkMode(BuildContext context) {
    final mode = _i?._themeMode;
    if (mode != null) {
      if (mode == ThemeMode.system) {
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
      } else {
        return mode == ThemeMode.dark;
      }
    } else {
      return Theme.of(context).brightness == Brightness.dark;
    }
  }

  static Color greenOf(bool dark) => _i?._green.detect(dark) ?? Colors.green;

  static Color blueOf(bool dark) => _i?._blue.detect(dark) ?? Colors.blue;

  static Color redOf(bool dark) => _i?._red.detect(dark) ?? Colors.red;

  static Color orangeOf(bool dark) => _i?._orange.detect(dark) ?? Colors.red;

  static Color yellowOf(bool dark) => _i?._yellow.detect(dark) ?? Colors.yellow;

  static Color purpleOf(bool dark) => _i?._purple.detect(dark) ?? Colors.purple;

  static Color pinkOf(bool dark) => _i?._pink.detect(dark) ?? Colors.pink;
}
