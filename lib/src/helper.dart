import 'package:flutter/material.dart';

extension ColorHelper on Color? {
  bool get isDark => (this ?? Colors.transparent).computeLuminance() < 0.5;

  Color get use => this ?? Colors.transparent;

  Color get dark => shade(.95);

  Color get light => tint(.95);

  Color get holoDark => shade(0.9);

  Color get holoLight => tint(0.9);

  Color get t01 => _tx(.01);

  Color get t02 => _tx(.02);

  Color get t05 => _tx(.05);

  Color get t10 => _tx(.10);

  Color get t15 => _tx(.15);

  Color get t20 => _tx(.20);

  Color get t25 => _tx(.25);

  Color get t30 => _tx(.30);

  Color get t40 => _tx(.40);

  Color get t50 => _tx(.50);

  Color get t60 => _tx(.60);

  Color get t70 => _tx(.70);

  Color get t75 => _tx(.75);

  Color get t80 => _tx(.80);

  Color get t85 => _tx(.85);

  Color get t90 => _tx(.90);

  Color get t95 => _tx(.95);

  Color get t98 => _tx(.98);

  Color get t99 => _tx(.99);

  Color get shade50 => tint(0.45);

  Color get shade100 => tint(0.35);

  Color get shade200 => tint(0.25);

  Color get shade300 => tint(0.15);

  Color get shade400 => tint(0.07);

  Color get shade500 => use;

  Color get shade600 => shade(0.18);

  Color get shade700 => shade(0.36);

  Color get shade800 => shade(0.72);

  Color get shade900 => shade(0.9);

  Color _tx(double value) => use.withValues(alpha: value);

  Color tr(double value) => _tx(value);

  Color tint(double value) {
    if (value <= 0 || value >= 1 || use == Colors.transparent) return use;
    final hsl = HSLColor.fromColor(use);
    return hsl.withLightness((hsl.lightness + value).clamp(0.0, 1.0)).toColor();
  }

  Color shade(double value) {
    if (value <= 0 || value >= 1 || use == Colors.transparent) return use;
    final hsl = HSLColor.fromColor(use);
    return hsl
        .withLightness((hsl.lightness - (value * 0.5)).clamp(0.0, 1.0))
        .toColor();
  }

  Color? mix(Color another, double amount) => Color.lerp(this, another, amount);

  String get asHex => '#${use.toARGB32().toRadixString(16).toUpperCase()}';

  int get asCode {
    var c = "0x${use.toARGB32().toRadixString(16)}";
    return int.tryParse(c) ?? 0x00000000;
  }
}
