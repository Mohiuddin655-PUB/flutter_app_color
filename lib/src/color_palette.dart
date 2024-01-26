part of '../app_color.dart';

class _Palette {
  final Color primary;

  final Color _brightness05;
  final Color _brightness10;
  final Color _brightness20;
  final Color _brightness30;
  final Color _brightness40;
  final Color _brightness50;
  final Color _brightness60;
  final Color _brightness70;
  final Color _brightness80;
  final Color _brightness90;

  final Color _darkness05;
  final Color _darkness10;
  final Color _darkness20;
  final Color _darkness30;
  final Color _darkness40;
  final Color _darkness50;
  final Color _darkness60;
  final Color _darkness70;
  final Color _darkness80;
  final Color _darkness90;

  const _Palette({
    required this.primary,
    Color? light,
    Color? holoLight,
    Color? dark,
    Color? holoDark,
    Color? brightness05,
    Color? brightness10,
    Color? brightness20,
    Color? brightness30,
    Color? brightness40,
    Color? brightness50,
    Color? brightness60,
    Color? brightness70,
    Color? brightness80,
    Color? brightness90,
    Color? darkness05,
    Color? darkness10,
    Color? darkness20,
    Color? darkness30,
    Color? darkness40,
    Color? darkness50,
    Color? darkness60,
    Color? darkness70,
    Color? darkness80,
    Color? darkness90,
  })  : _brightness05 = brightness05 ?? light ?? primary,
        _brightness10 = brightness10 ?? primary,
        _brightness20 = brightness20 ?? primary,
        _brightness30 = brightness30 ?? primary,
        _brightness40 = brightness40 ?? primary,
        _brightness50 = brightness50 ?? holoLight ?? primary,
        _brightness60 = brightness60 ?? primary,
        _brightness70 = brightness70 ?? primary,
        _brightness80 = brightness80 ?? primary,
        _brightness90 = brightness90 ?? primary,
        _darkness05 = darkness05 ?? primary,
        _darkness10 = darkness10 ?? primary,
        _darkness20 = darkness20 ?? holoDark ?? primary,
        _darkness30 = darkness30 ?? primary,
        _darkness40 = darkness40 ?? primary,
        _darkness50 = darkness50 ?? dark ?? primary,
        _darkness60 = darkness60 ?? primary,
        _darkness70 = darkness70 ?? primary,
        _darkness80 = darkness80 ?? primary,
        _darkness90 = darkness90 ?? primary;

  factory _Palette.fromCode(
    int primary, {
    int? light,
    int? holoLight,
    int? dark,
    int? holoDark,
    int? brightness05,
    int? brightness10,
    int? brightness20,
    int? brightness30,
    int? brightness40,
    int? brightness50,
    int? brightness60,
    int? brightness70,
    int? brightness80,
    int? brightness90,
    int? darkness05,
    int? darkness10,
    int? darkness20,
    int? darkness30,
    int? darkness40,
    int? darkness50,
    int? darkness60,
    int? darkness70,
    int? darkness80,
    int? darkness90,
  }) {
    return _Palette(
      primary: primary.color,
      light: (light ?? primary).color,
      holoLight: (holoLight ?? primary).color,
      dark: (dark ?? primary).color,
      holoDark: (holoDark ?? primary).color,
      brightness05: (brightness05 ?? primary).color,
      brightness10: (brightness10 ?? primary).color,
      brightness20: (brightness20 ?? primary).color,
      brightness30: (brightness30 ?? primary).color,
      brightness40: (brightness40 ?? primary).color,
      brightness50: (brightness50 ?? primary).color,
      brightness60: (brightness60 ?? primary).color,
      brightness70: (brightness70 ?? primary).color,
      brightness80: (brightness80 ?? primary).color,
      brightness90: (brightness90 ?? primary).color,
      darkness05: (darkness05 ?? primary).color,
      darkness10: (darkness10 ?? primary).color,
      darkness20: (darkness20 ?? primary).color,
      darkness30: (darkness30 ?? primary).color,
      darkness40: (darkness40 ?? primary).color,
      darkness50: (darkness50 ?? primary).color,
      darkness60: (darkness60 ?? primary).color,
      darkness70: (darkness70 ?? primary).color,
      darkness80: (darkness80 ?? primary).color,
      darkness90: (darkness90 ?? primary).color,
    );
  }

  factory _Palette.fromHex(
    String primary, {
    String? light,
    String? holoLight,
    String? dark,
    String? holoDark,
    String? brightness05,
    String? brightness10,
    String? brightness20,
    String? brightness30,
    String? brightness40,
    String? brightness50,
    String? brightness60,
    String? brightness70,
    String? brightness80,
    String? brightness90,
    String? darkness05,
    String? darkness10,
    String? darkness20,
    String? darkness30,
    String? darkness40,
    String? darkness50,
    String? darkness60,
    String? darkness70,
    String? darkness80,
    String? darkness90,
  }) {
    return _Palette(
      primary: primary.color,
      light: (light ?? primary).color,
      holoLight: (holoLight ?? primary).color,
      dark: (dark ?? primary).color,
      holoDark: (holoDark ?? primary).color,
      brightness05: (brightness05 ?? primary).color,
      brightness10: (brightness10 ?? primary).color,
      brightness20: (brightness20 ?? primary).color,
      brightness30: (brightness30 ?? primary).color,
      brightness40: (brightness40 ?? primary).color,
      brightness50: (brightness50 ?? primary).color,
      brightness60: (brightness60 ?? primary).color,
      brightness70: (brightness70 ?? primary).color,
      brightness80: (brightness80 ?? primary).color,
      brightness90: (brightness90 ?? primary).color,
      darkness05: (darkness05 ?? primary).color,
      darkness10: (darkness10 ?? primary).color,
      darkness20: (darkness20 ?? primary).color,
      darkness30: (darkness30 ?? primary).color,
      darkness40: (darkness40 ?? primary).color,
      darkness50: (darkness50 ?? primary).color,
      darkness60: (darkness60 ?? primary).color,
      darkness70: (darkness70 ?? primary).color,
      darkness80: (darkness80 ?? primary).color,
      darkness90: (darkness90 ?? primary).color,
    );
  }

  Map<int, Color> get swatch {
    return {
      -90: _brightness90,
      -80: _brightness80,
      -70: _brightness70,
      -60: _brightness60,
      -50: _brightness50,
      -40: _brightness40,
      -30: _brightness30,
      -20: _brightness20,
      -10: _brightness10,
      -05: _brightness05,
      0: primary,
      05: _darkness05,
      10: _darkness10,
      20: _darkness20,
      30: _darkness30,
      40: _darkness40,
      50: _darkness50,
      60: _darkness60,
      70: _darkness70,
      80: _darkness80,
      90: _darkness90,
    };
  }
}
