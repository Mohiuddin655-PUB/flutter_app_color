import 'package:flutter/material.dart';

import '../colors/red.dart';

const _kAppbar = "appbar";
const _kBase = "base";
const _kBackground = "background";
const _kBottom = "bottom";
const _kDialog = "dialog";
const _kDivider = "divider";
const _kIcon = "icon";
const _kScaffold = "scaffold";
const _kShadow = "shadow";
const _kSurface = "surface";
const _kText = "text";

final _kDefault = ColorThemeConfig(
  light: ThemeColors(
    light: Colors.white,
    dark: Colors.black,
    mid: Colors.grey.shade400,
    optional: Colors.transparent,
    error: RedColors.salmon.shade400,
  ),
  dark: ThemeColors(
    light: Colors.black,
    dark: Colors.white,
    mid: Colors.grey.shade600,
    optional: Colors.transparent,
    error: RedColors.salmon.shade600,
  ),
);

typedef ColorThemeConfigs = Map<String, ColorThemeConfig?>;
typedef GradientThemeConfigs = Map<String, GradientThemeConfig?>;

abstract class _Theme<T extends Object?> {
  final T? primary;
  final T? secondary;
  final T? tertiary;
  final T? error;
  final T? warning;
  final T? disable;
  final T? light;
  final T? dark;
  final T? mid;
  final T? holo;
  final T? optional;

  const _Theme({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.warning,
    this.disable,
    this.light,
    this.dark,
    this.mid,
    this.holo,
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
    final T? dark,
    final T? mid,
    final T? holo,
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
    final T? dark,
    final T? mid,
    final T? holo,
    final T? optional,
  });
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
    super.dark,
    super.mid,
    super.holo,
    super.optional,
  });

  @override
  ThemeColors copy({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? error,
    Color? warning,
    Color? disable,
    Color? light,
    Color? dark,
    Color? mid,
    Color? holo,
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
      dark: dark ?? this.dark,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
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
    Color? dark,
    Color? mid,
    Color? holo,
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
      dark: this.dark ?? dark,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      optional: this.optional ?? optional,
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
    super.dark,
    super.mid,
    super.holo,
    super.optional,
  });

  @override
  ThemeGradients copy({
    List<Color>? primary,
    List<Color>? secondary,
    List<Color>? tertiary,
    List<Color>? error,
    List<Color>? warning,
    List<Color>? disable,
    List<Color>? light,
    List<Color>? dark,
    List<Color>? mid,
    List<Color>? holo,
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
      dark: dark ?? this.dark,
      mid: mid ?? this.mid,
      holo: holo ?? this.holo,
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
    List<Color>? dark,
    List<Color>? mid,
    List<Color>? holo,
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
      dark: this.dark ?? dark,
      mid: this.mid ?? mid,
      holo: this.holo ?? holo,
      optional: this.optional ?? optional,
    );
  }
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

class ColorTheme {
  final ColorThemeConfigs _colors = {_kBase: _kDefault};
  final GradientThemeConfigs _gradients = {};

  static ColorTheme? _i;

  static ColorTheme get i {
    if (_i != null) {
      return _i!;
    } else {
      throw UnimplementedError("ColorTheme not initialized yet!");
    }
  }

  static ColorThemeConfig? colorOf(String name) => _i?._colors[name];

  static GradientThemeConfig? gradientOf(String name) => _i?._gradients[name];

  static void init({
    // COLORS
    ColorThemeConfig? appbar,
    ColorThemeConfig? base,
    ColorThemeConfig? background,
    ColorThemeConfig? bottom,
    ColorThemeConfig? dialog,
    ColorThemeConfig? divider,
    ColorThemeConfig? icon,
    ColorThemeConfig? scaffold,
    ColorThemeConfig? shadow,
    ColorThemeConfig? surface,
    ColorThemeConfig? text,
    Iterable<ColorThemeData> colors = const [],
    // GRADIENTS
    GradientThemeConfig? appbarGradient,
    GradientThemeConfig? baseGradient,
    GradientThemeConfig? backgroundGradient,
    GradientThemeConfig? bottomGradient,
    GradientThemeConfig? dialogGradient,
    GradientThemeConfig? dividerGradient,
    GradientThemeConfig? iconGradient,
    GradientThemeConfig? scaffoldGradient,
    GradientThemeConfig? shadowGradient,
    GradientThemeConfig? surfaceGradient,
    GradientThemeConfig? textGradient,
    Iterable<GradientThemeData> gradients = const [],
  }) {
    _i = ColorTheme._(
      // COLORS
      appbar: appbar,
      base: base,
      background: background,
      bottom: bottom,
      dialog: dialog,
      divider: divider,
      icon: icon,
      scaffold: scaffold,
      shadow: shadow,
      surface: surface,
      text: text,
      colors: colors,
      // GRADIENTS
      appbarGradient: appbarGradient,
      baseGradient: baseGradient,
      backgroundGradient: backgroundGradient,
      bottomGradient: bottomGradient,
      dialogGradient: dialogGradient,
      dividerGradient: dividerGradient,
      iconGradient: iconGradient,
      scaffoldGradient: scaffoldGradient,
      shadowGradient: shadowGradient,
      surfaceGradient: surfaceGradient,
      textGradient: textGradient,
      gradients: gradients,
    );
  }

  ColorTheme._({
    // COLORS
    ColorThemeConfig? appbar,
    ColorThemeConfig? base,
    ColorThemeConfig? background,
    ColorThemeConfig? bottom,
    ColorThemeConfig? dialog,
    ColorThemeConfig? divider,
    ColorThemeConfig? icon,
    ColorThemeConfig? scaffold,
    ColorThemeConfig? shadow,
    ColorThemeConfig? surface,
    ColorThemeConfig? text,
    Iterable<ColorThemeData> colors = const [],
    // GRADIENTS
    GradientThemeConfig? appbarGradient,
    GradientThemeConfig? baseGradient,
    GradientThemeConfig? backgroundGradient,
    GradientThemeConfig? bottomGradient,
    GradientThemeConfig? dialogGradient,
    GradientThemeConfig? dividerGradient,
    GradientThemeConfig? iconGradient,
    GradientThemeConfig? scaffoldGradient,
    GradientThemeConfig? shadowGradient,
    GradientThemeConfig? surfaceGradient,
    GradientThemeConfig? textGradient,
    Iterable<GradientThemeData> gradients = const [],
  }) {
    // COLORS
    if (appbar != null) _colors[_kAppbar] = appbar;
    if (base != null) _colors[_kBase] = base;
    if (background != null) _colors[_kBackground] = background;
    if (bottom != null) _colors[_kBottom] = bottom;
    if (dialog != null) _colors[_kDialog] = dialog;
    if (divider != null) _colors[_kDivider] = divider;
    if (icon != null) _colors[_kIcon] = icon;
    if (scaffold != null) _colors[_kScaffold] = scaffold;
    if (shadow != null) _colors[_kShadow] = shadow;
    if (surface != null) _colors[_kSurface] = surface;
    if (text != null) _colors[_kText] = text;
    if (colors.isNotEmpty) {
      _colors.addEntries(colors.map((e) => MapEntry(e.name, e.config)));
    }
    // GRADIENTS
    if (appbarGradient != null) _gradients[_kAppbar] = appbarGradient;
    if (baseGradient != null) _gradients[_kBase] = baseGradient;
    if (backgroundGradient != null) {
      _gradients[_kBackground] = backgroundGradient;
    }
    if (bottom != null) _gradients[_kBottom] = bottomGradient;
    if (dialogGradient != null) _gradients[_kDialog] = dialogGradient;
    if (dividerGradient != null) _gradients[_kDivider] = dividerGradient;
    if (iconGradient != null) _gradients[_kIcon] = iconGradient;
    if (scaffoldGradient != null) _gradients[_kScaffold] = scaffoldGradient;
    if (shadowGradient != null) _gradients[_kShadow] = shadowGradient;
    if (surfaceGradient != null) _gradients[_kSurface] = surfaceGradient;
    if (textGradient != null) _gradients[_kText] = textGradient;
    if (gradients.isNotEmpty) {
      _gradients.addEntries(gradients.map((e) => MapEntry(e.name, e.config)));
    }
  }

  // COLORS
  ColorThemeConfig? get appbar => _colors[_kAppbar];

  ColorThemeConfig? get base => _colors[_kBase];

  ColorThemeConfig? get background => _colors[_kBackground];

  ColorThemeConfig? get bottom => _colors[_kBottom];

  ColorThemeConfig? get dialog => _colors[_kDialog];

  ColorThemeConfig? get divider => _colors[_kDivider];

  ColorThemeConfig? get icon => _colors[_kIcon];

  ColorThemeConfig? get scaffold => _colors[_kScaffold];

  ColorThemeConfig? get shadow => _colors[_kShadow];

  ColorThemeConfig? get surface => _colors[_kSurface];

  ColorThemeConfig? get text => _colors[_kText];

  // GRADIENTS
  GradientThemeConfig? get appbarGradient => _gradients[_kAppbar];

  GradientThemeConfig? get baseGradient => _gradients[_kBase];

  GradientThemeConfig? get backgroundGradient => _gradients[_kBackground];

  GradientThemeConfig? get bottomGradient => _gradients[_kBottom];

  GradientThemeConfig? get dialogGradient => _gradients[_kDialog];

  GradientThemeConfig? get dividerGradient => _gradients[_kDivider];

  GradientThemeConfig? get iconGradient => _gradients[_kIcon];

  GradientThemeConfig? get scaffoldGradient => _gradients[_kScaffold];

  GradientThemeConfig? get shadowGradient => _gradients[_kShadow];

  GradientThemeConfig? get surfaceGradient => _gradients[_kSurface];

  GradientThemeConfig? get textGradient => _gradients[_kText];
}

extension ColorThemeHelper on BuildContext {
  // THEME

  ThemeData get _t => Theme.of(this);

  bool get isDarkMode {
    final tb = Theme.of(this).brightness == Brightness.dark;
    final mb = MediaQuery.platformBrightnessOf(this) == Brightness.dark;
    return tb || mb;
  }

  ThemeColors colorOf(String name) {
    final x = ColorTheme.colorOf(name)?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeColors();
  }

  ThemeGradients gradientOf(String name) {
    final x = ColorTheme.gradientOf(name)?.detect(isDarkMode);
    if (x != null) return x;
    return const ThemeGradients();
  }

  // COLORS

  Color get primary => baseColor.primary ?? _t.primaryColor;

  Color get secondary => baseColor.secondary ?? _t.colorScheme.secondary;

  Color get tertiary => baseColor.tertiary ?? _t.colorScheme.tertiary;

  Color? get light => baseColor.light;

  Color? get dark => baseColor.dark;

  Color? get mid => baseColor.mid;

  Color? get holo => baseColor.holo;

  Color? get disable => baseColor.disable;

  Color? get error => baseColor.error;

  Color? get warning => baseColor.warning;

  Color? get optional => baseColor.optional;

  ThemeColors get appbarColor {
    return colorOf(_kAppbar).defaults(primary: _t.appBarTheme.backgroundColor);
  }

  ThemeColors get baseColor {
    final x = _kDefault.detect(isDarkMode);
    return colorOf(_kBase).defaults(
      primary: _t.colorScheme.primary,
      secondary: _t.colorScheme.secondary,
      tertiary: _t.colorScheme.tertiary,
      light: x.light,
      dark: x.dark,
      mid: x.mid,
      optional: x.optional,
      error: x.error,
    );
  }

  ThemeColors get backgroundColor => colorOf(_kBackground);

  ThemeColors get bottomColor {
    return colorOf(_kBottom).defaults(primary: _t.bottomAppBarTheme.color);
  }

  ThemeColors get dialogColor {
    return colorOf(_kDialog).defaults(
      primary: _t.dialogTheme.backgroundColor ?? _t.dialogBackgroundColor,
    );
  }

  ThemeColors get dividerColor {
    return colorOf(_kDivider).defaults(primary: _t.dividerColor);
  }

  ThemeColors get iconColor {
    return colorOf(_kIcon).defaults(primary: _t.iconTheme.color);
  }

  ThemeColors get scaffoldColor {
    return colorOf(_kScaffold).defaults(primary: _t.scaffoldBackgroundColor);
  }

  ThemeColors get shadowColor {
    return colorOf(_kShadow).defaults(primary: _t.shadowColor);
  }

  ThemeColors get surfaceColor {
    return colorOf(_kSurface).defaults(primary: _t.colorScheme.surface);
  }

  ThemeColors get textColor => colorOf(_kText);

  // GRADIENTS

  ThemeGradients get appbarGradient => gradientOf(_kAppbar);

  ThemeGradients get baseGradient => gradientOf(_kBase);

  ThemeGradients get backgroundGradient => gradientOf(_kBackground);

  ThemeGradients get bottomGradient => gradientOf(_kBottom);

  ThemeGradients get dialogGradient => gradientOf(_kDialog);

  ThemeGradients get dividerGradient => gradientOf(_kDivider);

  ThemeGradients get iconGradient => gradientOf(_kIcon);

  ThemeGradients get scaffoldGradient => gradientOf(_kScaffold);

  ThemeGradients get shadowGradient => gradientOf(_kShadow);

  ThemeGradients get surfaceGradient => gradientOf(_kSurface);

  ThemeGradients get textGradient => gradientOf(_kText);
}
