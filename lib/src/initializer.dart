import 'dart:convert';

import 'package:flutter/material.dart';

import 'theme.dart';

class ColorThemes extends ValueNotifier<ColorTheme> {
  final Map<String, ColorTheme> themes;

  String? active;

  List<String> get names => themes.keys.toList();

  ColorThemes({
    this.active,
    required this.themes,
  }) : super(themes[active] ?? themes.values.firstOrNull ?? ColorTheme());

  ColorThemes.none() : this(themes: {});

  factory ColorThemes.parse(Object? payload, {bool updateUi = false}) {
    if (payload == null) return ColorThemes.none();
    if (payload is String) payload = jsonDecode(payload);
    if (payload is! Map) return ColorThemes.none();
    final rawActive = payload['default'] ?? payload['active'];
    final active = rawActive is String ? rawActive : 'default';

    final rawThemes = payload['themes'];
    final themes = rawThemes is Map
        ? rawThemes.entries.map((e) {
            final k = e.key.toString();
            if (k.isEmpty) return null;
            final v = e.value;
            if (v is! Map) return null;
            final theme = ColorTheme.tryParse(v);
            if (theme == null) return null;
            return MapEntry(k, theme);
          }).whereType<MapEntry<String, ColorTheme>>()
        : <MapEntry<String, ColorTheme>>[];
    if (themes.isEmpty) return ColorThemes.none();
    return ColorThemes(active: active, themes: Map.fromEntries(themes));
  }

  static ColorThemes? _i;

  static ColorThemes get i => _i ??= ColorThemes.none();

  static ColorTheme? theme(String? name) {
    return i.themes[name] ?? i.themes.values.firstOrNull;
  }

  static void activate({String? name}) {
    if (name != null && name.isNotEmpty) i.active = name;
    theme(name)?.apply();
    i.notifyListeners();
  }

  Map<String, dynamic>? toMap() {
    final entries = this.themes.entries.map((e) {
      final k = e.key;
      if (k.isEmpty) return null;
      final v = e.value.toMap();
      if (v == null) return null;
      return MapEntry(k, v);
    }).whereType<MapEntry>();
    final themes = Map.fromEntries(entries);
    if (themes.isEmpty) return null;
    return {
      if (active?.isNotEmpty ?? false) "default": active,
      if (themes.isNotEmpty) "themes": themes,
    };
  }

  @override
  String toString() => "$ColorThemes(${toMap()})";
}
