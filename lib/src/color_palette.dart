part of '../app_color.dart';

class _Palette {
  final Color primary;

  final Color _tint50;
  final Color _tint100;
  final Color _tint200;
  final Color _tint300;
  final Color _tint400;
  final Color _tint500;
  final Color _tint600;
  final Color _tint700;
  final Color _tint800;
  final Color _tint900;

  final Color _shade50;
  final Color _shade100;
  final Color _shade200;
  final Color _shade300;
  final Color _shade400;
  final Color _shade500;
  final Color _shade600;
  final Color _shade700;
  final Color _shade800;
  final Color _shade900;

  const _Palette({
    required this.primary,
    Color? tint50,
    Color? tint100,
    Color? tint200,
    Color? tint300,
    Color? tint400,
    Color? tint500,
    Color? tint600,
    Color? tint700,
    Color? tint800,
    Color? tint900,
    Color? shade50,
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? shade900,
  })  : _tint50 = tint50 ?? primary,
        _tint100 = tint100 ?? primary,
        _tint200 = tint200 ?? primary,
        _tint300 = tint300 ?? primary,
        _tint400 = tint400 ?? primary,
        _tint500 = tint500 ?? primary,
        _tint600 = tint600 ?? primary,
        _tint700 = tint700 ?? primary,
        _tint800 = tint800 ?? primary,
        _tint900 = tint900 ?? primary,
        _shade50 = shade50 ?? primary,
        _shade100 = shade100 ?? primary,
        _shade200 = shade200 ?? primary,
        _shade300 = shade300 ?? primary,
        _shade400 = shade400 ?? primary,
        _shade500 = shade500 ?? primary,
        _shade600 = shade600 ?? primary,
        _shade700 = shade700 ?? primary,
        _shade800 = shade800 ?? primary,
        _shade900 = shade900 ?? primary;

  factory _Palette.fromCode(
    int primary, {
    int? tint50,
    int? tint100,
    int? tint200,
    int? tint300,
    int? tint400,
    int? tint500,
    int? tint600,
    int? tint700,
    int? tint800,
    int? tint900,
    int? shade50,
    int? shade100,
    int? shade200,
    int? shade300,
    int? shade400,
    int? shade500,
    int? shade600,
    int? shade700,
    int? shade800,
    int? shade900,
  }) {
    return _Palette(
      primary: primary.color,
      tint50: (tint50 ?? primary).color,
      tint100: (tint100 ?? primary).color,
      tint200: (tint200 ?? primary).color,
      tint300: (tint300 ?? primary).color,
      tint400: (tint400 ?? primary).color,
      tint500: (tint500 ?? primary).color,
      tint600: (tint600 ?? primary).color,
      tint700: (tint700 ?? primary).color,
      tint800: (tint800 ?? primary).color,
      tint900: (tint900 ?? primary).color,
      shade50: (shade50 ?? primary).color,
      shade100: (shade100 ?? primary).color,
      shade200: (shade200 ?? primary).color,
      shade300: (shade300 ?? primary).color,
      shade400: (shade400 ?? primary).color,
      shade500: (shade500 ?? primary).color,
      shade600: (shade600 ?? primary).color,
      shade700: (shade700 ?? primary).color,
      shade800: (shade800 ?? primary).color,
      shade900: (shade900 ?? primary).color,
    );
  }

  factory _Palette.fromHex(
    String primary, {
    String? tint50,
    String? tint100,
    String? tint200,
    String? tint300,
    String? tint400,
    String? tint500,
    String? tint600,
    String? tint700,
    String? tint800,
    String? tint900,
    String? shade50,
    String? shade100,
    String? shade200,
    String? shade300,
    String? shade400,
    String? shade500,
    String? shade600,
    String? shade700,
    String? shade800,
    String? shade900,
  }) {
    return _Palette(
      primary: primary.color,
      tint50: (tint50 ?? primary).color,
      tint100: (tint100 ?? primary).color,
      tint200: (tint200 ?? primary).color,
      tint300: (tint300 ?? primary).color,
      tint400: (tint400 ?? primary).color,
      tint500: (tint500 ?? primary).color,
      tint600: (tint600 ?? primary).color,
      tint700: (tint700 ?? primary).color,
      tint800: (tint800 ?? primary).color,
      tint900: (tint900 ?? primary).color,
      shade50: (shade50 ?? primary).color,
      shade100: (shade100 ?? primary).color,
      shade200: (shade200 ?? primary).color,
      shade300: (shade300 ?? primary).color,
      shade400: (shade400 ?? primary).color,
      shade500: (shade500 ?? primary).color,
      shade600: (shade600 ?? primary).color,
      shade700: (shade700 ?? primary).color,
      shade800: (shade800 ?? primary).color,
      shade900: (shade900 ?? primary).color,
    );
  }

  Map<int, Color> get swatch {
    return {
      -90: _tint900,
      -80: _tint800,
      -70: _tint700,
      -60: _tint600,
      -50: _tint500,
      -40: _tint400,
      -30: _tint300,
      -20: _tint200,
      -10: _tint100,
      -05: _tint50,
      0: primary,
      05: _shade50,
      10: _shade100,
      20: _shade200,
      30: _shade300,
      40: _shade400,
      50: _shade500,
      60: _shade600,
      70: _shade700,
      80: _shade800,
      90: _shade900,
    };
  }
}

extension _ColorCodeExtension on int {
  Color get color => Color(this);
}

extension _ColorHexExtension on String {
  int get code {
    var code = replaceAll("#", "");
    if (code.length == 6) {
      return int.tryParse("0xff$code") ?? 0x00000000;
    }
    return 0x00000000;
  }

  Color get color => Color(code);
}
