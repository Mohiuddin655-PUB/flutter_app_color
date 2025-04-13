import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeColor<T extends Color> extends Color {
  final T light;
  final T dark;

  ThemeColor({
    required this.light,
    T? dark,
  })  : dark = dark ?? light,
        super(light.toARGB32());

  T of(BuildContext context) => detect(context.isDarkMode);

  T detect(bool darkMode) => darkMode ? dark : light;

  static ThemeColor? tryParse(Object? source) {
    if (source is! Map) return null;
    final light = source["light"];
    final dark = source["dark"];
    return ThemeColor(
      light: light is String ? light.color.use : Colors.transparent,
      dark: dark is String ? dark.color : null,
    );
  }

  String? _stringify(T? value) {
    if (value == null) return null;
    try {
      return value.toARGB32().toRadixString(16);
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic>? toJson() {
    final x = {
      "light": _stringify(light),
      "dark": _stringify(dark),
    };
    final y = x.entries.where((e) {
      if (e.value == null) return false;
      return true;
    });
    if (y.isEmpty) return null;
    return Map.fromEntries(y);
  }

  @override
  String toString() {
    return "ThemeColor(light: ${light.code}, dark: ${dark.code})";
  }
}

extension ColorParser on Object? {
  Color? get color {
    if (this == null) return null;
    Object? raw = this;
    if (raw is String) {
      raw
          .toLowerCase()
          .replaceAll("#", '')
          .replaceAll("color(", '')
          .replaceAll(")", '');
      if (raw.length == 6 && !raw.startsWith("0x")) {
        raw = "0xFF$raw";
      } else if (raw.length == 8 && !raw.startsWith("0x")) {
        raw = "0x$raw";
      }
      final code = int.tryParse(raw);
      if (code == null) return null;
      return Color(code);
    } else if (raw is num) {
      int value = raw.toInt();
      return Color(value);
    }
    return null;
  }
}

extension ColorConverter on Color? {
  Color get use => this ?? Colors.transparent;

  int? get value => this?.toARGB32();

  String? get code => value?.toRadixString(16);

  String? get codeWithHas => code == null ? null : "#$code";
}
