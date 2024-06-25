import 'package:flutter/material.dart';

import '../src/extension.dart';

const _kBase = "base";
const _kBackground = "background";
const _kDivider = "divider";
const _kIcon = "icon";
const _kShadow = "shadow";
const _kSurface = "surface";
const _kText = "text";

typedef ColorThemeConfigs = Map<String, ColorThemeConfig?>;

class ColorThemeData {
  final String name;
  final ColorThemeConfig config;

  const ColorThemeData({
    required this.name,
    required this.config,
  });
}

class ColorTheme {
  final ColorThemeConfigs _proxies = {};

  static ColorTheme? _i;

  static ColorTheme get i {
    if (_i != null) {
      return _i!;
    } else {
      throw UnimplementedError("ColorTheme not initialized yet!");
    }
  }

  static ColorThemeConfig? of(String name) => _i?._proxies[name];

  static ColorTheme init({
    final ColorThemeConfig? base,
    final ColorThemeConfig? background,
    final ColorThemeConfig? divider,
    final ColorThemeConfig? icon,
    final ColorThemeConfig? shadow,
    final ColorThemeConfig? surface,
    final ColorThemeConfig? text,
    final Iterable<ColorThemeData> data = const [],
  }) {
    _i = ColorTheme._(
      base: base,
      background: background,
      divider: divider,
      icon: icon,
      shadow: shadow,
      surface: surface,
      text: text,
      data: data,
    );
    return i;
  }

  ColorTheme._({
    final ColorThemeConfig? base,
    final ColorThemeConfig? background,
    final ColorThemeConfig? divider,
    final ColorThemeConfig? icon,
    final ColorThemeConfig? shadow,
    final ColorThemeConfig? surface,
    final ColorThemeConfig? text,
    final Iterable<ColorThemeData> data = const [],
  }) {
    if (base != null) _proxies[_kBase] = base;
    if (background != null) _proxies[_kBackground] = background;
    if (divider != null) _proxies[_kDivider] = divider;
    if (icon != null) _proxies[_kIcon] = icon;
    if (shadow != null) _proxies[_kShadow] = shadow;
    if (surface != null) _proxies[_kSurface] = surface;
    if (text != null) _proxies[_kText] = text;
    if (data.isNotEmpty) {
      _proxies.addEntries(data.map((e) => MapEntry(e.name, e.config)));
    }
  }

  ColorThemeConfig? get background => _proxies[_kBackground];

  ColorThemeConfig? get divider => _proxies[_kDivider];

  ColorThemeConfig? get icon => _proxies[_kIcon];

  ColorThemeConfig? get shadow => _proxies[_kShadow];

  ColorThemeConfig? get surface => _proxies[_kSurface];

  ColorThemeConfig? get text => _proxies[_kText];
}

class ColorThemeConfig {
  final ThemeColors light;
  final ThemeColors dark;

  const ColorThemeConfig({
    required this.light,
    ThemeColors? dark,
  }) : dark = dark ?? light;

  ThemeColors detect(bool darkMode) => darkMode ? dark : light;
}

class ThemeColors {
  final Color? primary;
  final Color? secondary;
  final Color? tertiary;
  final Color? error;
  final Color? warning;
  final Color? disable;

  const ThemeColors({
    this.primary,
    this.secondary,
    this.tertiary,
    this.error,
    this.warning,
    this.disable,
  });
}

extension ColorThemeHelper on BuildContext {
  ThemeColors themeOf(String name) {
    final x = ColorTheme.of(name)?.detect(isDarkMode);
    if (x == null) return const ThemeColors();
    return x;
  }

  ThemeColors get base => themeOf(_kBase);

  ThemeColors get background => themeOf(_kBackground);

  ThemeColors get divider => themeOf(_kDivider);

  ThemeColors get icon => themeOf(_kIcon);

  ThemeColors get shadow => themeOf(_kShadow);

  ThemeColors get surface => themeOf(_kSurface);

  ThemeColors get text => themeOf(_kText);
}
