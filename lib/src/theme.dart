import 'dart:convert';
import 'dart:math';

import 'package:app_color/extension.dart';
import 'package:flutter/material.dart';

import 'theme_color.dart';

part 'colors.dart';
part 'config.dart';
part 'content.dart';
part 'context.dart';
part 'data.dart';
part 'defaults.dart';
part 'keys.dart';
part 'types.dart';

class ColorTheme extends ChangeNotifier {
  final ThemeColor? _green;
  final ThemeColor? _grey;
  final ThemeColor? _blue;
  final ThemeColor? _red;
  final ThemeColor? _orange;
  final ThemeColor? _yellow;
  final ThemeColor? _purple;
  final ThemeColor? _pink;
  final _Colors _colors = {_kBase: _kDefault};
  final _Colors _customs = {};
  final _Gradients _gradients = {};

  ThemeColor get green => _green ?? kGreen;

  ThemeColor get grey => _grey ?? kGrey;

  ThemeColor get blue => _blue ?? kBlue;

  ThemeColor get red => _red ?? kRed;

  ThemeColor get orange => _orange ?? kOrange;

  ThemeColor get yellow => _yellow ?? kYellow;

  ThemeColor get purple => _purple ?? kPurple;

  ThemeColor get pink => _pink ?? kPink;

  ColorThemeConfig get colors => colorConfigOf(_kBase);

  ColorThemeConfig get appbar => colorConfigOf(_kAppbar);

  ColorThemeConfig get background => colorConfigOf(_kBackground);

  ColorThemeConfig get bottom => colorConfigOf(_kBottom);

  ColorThemeConfig get card => colorConfigOf(_kCard);

  ColorThemeConfig get dialog => colorConfigOf(_kDialog);

  ColorThemeConfig get divider => colorConfigOf(_kDivider);

  ColorThemeConfig get highlight => colorConfigOf(_kHighlight);

  ColorThemeConfig get hint => colorConfigOf(_kHint);

  ColorThemeConfig get hover => colorConfigOf(_kHover);

  ColorThemeConfig get icon => colorConfigOf(_kIcon);

  ColorThemeConfig get label => colorConfigOf(_kLabel);

  ColorThemeConfig get placeholder => colorConfigOf(_kPlaceholder);

  ColorThemeConfig get scaffold => colorConfigOf(_kScaffold);

  ColorThemeConfig get shadow => colorConfigOf(_kShadow);

  ColorThemeConfig get splash => colorConfigOf(_kSplash);

  ColorThemeConfig get surface => colorConfigOf(_kSurface);

  ColorThemeConfig get text => colorConfigOf(_kText);

  ThemeMode? _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  static ColorTheme? _i;

  static ColorTheme get i => _i ??= ColorTheme();

  static ColorTheme? tryParse(Object? payload) {
    if (payload == null) return null;
    if (payload is String) payload = jsonDecode(payload);
    if (payload is! Map) return null;

    final rawThemeMode =
        payload['themeMode'] ?? payload['theme_mode'] ?? payload['mode'];
    final themeMode = rawThemeMode is Object ? rawThemeMode._tm : null;

    final green = ThemeColor.tryParse(payload['green']);
    final grey = ThemeColor.tryParse(payload['grey']);
    final blue = ThemeColor.tryParse(payload['blue']);
    final red = ThemeColor.tryParse(payload['red']);
    final orange = ThemeColor.tryParse(payload['orange']);
    final yellow = ThemeColor.tryParse(payload['yellow']);
    final purple = ThemeColor.tryParse(payload['purple']);
    final pink = ThemeColor.tryParse(payload['pink']);

    final base = ColorThemeConfig.tryParse(payload[_kBase]);
    final appbar = ColorThemeConfig.tryParse(payload[_kAppbar]);
    final background = ColorThemeConfig.tryParse(payload[_kBackground]);
    final bottom = ColorThemeConfig.tryParse(payload[_kBottom]);
    final card = ColorThemeConfig.tryParse(payload[_kCard]);
    final dialog = ColorThemeConfig.tryParse(payload[_kDialog]);
    final divider = ColorThemeConfig.tryParse(payload[_kDivider]);
    final highlight = ColorThemeConfig.tryParse(payload[_kHighlight]);
    final hint = ColorThemeConfig.tryParse(payload[_kHint]);
    final hover = ColorThemeConfig.tryParse(payload[_kHover]);
    final icon = ColorThemeConfig.tryParse(payload[_kIcon]);
    final label = ColorThemeConfig.tryParse(payload[_kLabel]);
    final placeholder = ColorThemeConfig.tryParse(payload[_kPlaceholder]);
    final scaffold = ColorThemeConfig.tryParse(payload[_kScaffold]);
    final shadow = ColorThemeConfig.tryParse(payload[_kShadow]);
    final surface = ColorThemeConfig.tryParse(payload[_kSurface]);
    final text = ColorThemeConfig.tryParse(payload[_kText]);
    final rawColors = payload['colors'];
    final colors = rawColors is List
        ? rawColors
            .map(ColorThemeData.tryParse)
            .whereType<ColorThemeData>()
            .toList()
        : null;

    final rawGradients = payload['gradients'];
    final gradients = rawGradients is List
        ? rawGradients
            .map(GradientThemeData.tryParse)
            .whereType<GradientThemeData>()
            .toList()
        : null;

    return ColorTheme(
      themeMode: themeMode,
      green: green,
      grey: grey,
      blue: blue,
      red: red,
      orange: orange,
      yellow: yellow,
      purple: purple,
      pink: pink,
      base: base,
      appbar: appbar,
      background: background,
      bottom: bottom,
      card: card,
      dialog: dialog,
      divider: divider,
      highlight: highlight,
      hint: hint,
      hover: hover,
      icon: icon,
      label: label,
      placeholder: placeholder,
      scaffold: scaffold,
      shadow: shadow,
      surface: surface,
      text: text,
      colors: colors ?? [],
      gradients: gradients ?? [],
    );
  }

  static Future<void> init({Future<Object?>? Function()? payload}) async {
    if (payload == null) return;
    _i = ColorTheme.tryParse(payload);
    i.notifyListeners();
  }

  bool isDarkMode(BuildContext context) {
    final mode = i._themeMode;
    if (mode != null) {
      if (mode == ThemeMode.system) {
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
      } else {
        if (mode == ThemeMode.light) {
          return Theme.of(context).brightness == Brightness.dark;
        } else {
          return mode == ThemeMode.dark;
        }
      }
    } else {
      return Theme.of(context).brightness == Brightness.dark;
    }
  }

  Color greenOf([bool? dark]) => _green?.detect(dark ?? isDark) ?? kGreen;

  Color greyOf([bool? dark]) => _grey?.detect(dark ?? isDark) ?? kGrey;

  Color blueOf([bool? dark]) => _blue?.detect(dark ?? isDark) ?? kBlue;

  Color redOf([bool? dark]) => _red?.detect(dark ?? isDark) ?? kRed;

  Color orangeOf([bool? dark]) => _orange?.detect(dark ?? isDark) ?? kOrange;

  Color yellowOf([bool? dark]) => _yellow?.detect(dark ?? isDark) ?? kYellow;

  Color purpleOf([bool? dark]) => _purple?.detect(dark ?? isDark) ?? kPurple;

  Color pinkOf([bool? dark]) => _pink?.detect(dark ?? isDark) ?? kPink;

  ThemeColors colorsOf(String name, [bool? dark]) {
    return colorConfigOf(name).detect(dark ?? i.isDark);
  }

  ColorThemeConfig colorConfigOf(String name) {
    return _colors[name] ?? ColorThemeConfig.none();
  }

  ThemeGradients gradientsOf(String name, [bool? dark]) {
    return gradientConfigOf(name).detect(dark ?? i.isDark);
  }

  GradientThemeConfig gradientConfigOf(String name) {
    return _gradients[name] ?? GradientThemeConfig.none();
  }

  void setThemeMode(ThemeMode? mode) {
    _themeMode = mode;
    notifyListeners();
  }

  ColorTheme({
    ThemeMode? themeMode,
    ThemeColor? green,
    ThemeColor? grey,
    ThemeColor? blue,
    ThemeColor? red,
    ThemeColor? orange,
    ThemeColor? yellow,
    ThemeColor? purple,
    ThemeColor? pink,
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
    Iterable<GradientThemeData> gradients = const [],
  })  : _themeMode = themeMode,
        _green = green,
        _grey = grey,
        _blue = blue,
        _red = red,
        _orange = orange,
        _yellow = yellow,
        _purple = purple,
        _pink = pink {
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
    if (gradients.isNotEmpty) {
      _gradients.addEntries(gradients.map((e) {
        return MapEntry(e.name, e.config);
      }));
    }
  }

  void apply() => _i = this;

  Map<String, dynamic>? toMap() {
    final colors = _customs.entries
        .map((e) {
          if (e.value == null) return null;
          return ColorThemeData(name: e.key, config: e.value!).toMap();
        })
        .where((e) => e != null)
        .toList();
    final gradients = _gradients.entries
        .map((e) {
          if (e.value == null) return null;
          return GradientThemeData(name: e.key, config: e.value!).toMap();
        })
        .where((e) => e != null)
        .toList();
    final x = {
      "themeMode": _themeMode?.toString(),
      "green": _green?.toJson(),
      "grey": _grey?.toJson(),
      "blue": _blue?.toJson(),
      "red": _red?.toJson(),
      "orange": _orange?.toJson(),
      "yellow": _yellow?.toJson(),
      "purple": _purple?.toJson(),
      "pink": _pink?.toJson(),
      ..._colors.map((key, value) {
        return MapEntry(key, value?.toMap());
      }),
      if (colors.isNotEmpty) "colors": colors,
      if (gradients.isNotEmpty) "gradients": gradients,
    };
    final y = x.entries.where((e) {
      if (e.value == null) return false;
      return true;
    });
    if (y.isEmpty) return null;
    return Map.fromEntries(y);
  }

  @override
  String toString() => "$ColorTheme(${toMap()})";
}

extension on Object? {
  ThemeMode? get _tm {
    final x = ThemeMode.values.where((e) {
      final s = toString().toLowerCase();
      if (e.toString().toLowerCase() == s) return true;
      if (e.index.toString() == s) return true;
      if (e.name.toLowerCase().toString() == s) return true;
      return false;
    }).firstOrNull;
    return x;
  }
}
