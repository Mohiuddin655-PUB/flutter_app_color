part of '../app_color.dart';

class AppColor extends MaterialColor {
  final int primary;
  final Map<int, Color> swatch;

  const AppColor(
    this.primary, [
    this.swatch = const {},
  ]) : super(primary, swatch);

  factory AppColor._fromPalette(_Palette palette) {
    return AppColor(palette.primary.value, palette.swatch);
  }

  factory AppColor.fromCode(
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
    return AppColor._fromPalette(_Palette.fromCode(
      primary,
      light: light,
      holoLight: holoLight,
      dark: dark,
      holoDark: holoLight,
      brightness05: brightness05,
      brightness10: brightness10,
      brightness20: brightness20,
      brightness30: brightness30,
      brightness40: brightness40,
      brightness50: brightness50,
      brightness60: brightness60,
      brightness70: brightness70,
      brightness80: brightness80,
      brightness90: brightness90,
      darkness05: darkness05,
      darkness10: darkness10,
      darkness20: darkness20,
      darkness30: darkness30,
      darkness40: darkness40,
      darkness50: darkness50,
      darkness60: darkness60,
      darkness70: darkness70,
      darkness80: darkness80,
      darkness90: darkness90,
    ));
  }

  factory AppColor.fromColor(
    Color primary, {
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
  }) {
    return AppColor._fromPalette(_Palette(
      primary: primary,
      light: light,
      holoLight: holoLight,
      dark: dark,
      holoDark: holoLight,
      brightness05: brightness05,
      brightness10: brightness10,
      brightness20: brightness20,
      brightness30: brightness30,
      brightness40: brightness40,
      brightness50: brightness50,
      brightness60: brightness60,
      brightness70: brightness70,
      brightness80: brightness80,
      brightness90: brightness90,
      darkness05: darkness05,
      darkness10: darkness10,
      darkness20: darkness20,
      darkness30: darkness30,
      darkness40: darkness40,
      darkness50: darkness50,
      darkness60: darkness60,
      darkness70: darkness70,
      darkness80: darkness80,
      darkness90: darkness90,
    ));
  }

  factory AppColor.fromHex(
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
    return AppColor._fromPalette(_Palette.fromHex(
      primary,
      light: light,
      holoLight: holoLight,
      dark: dark,
      holoDark: holoLight,
      brightness05: brightness05,
      brightness10: brightness10,
      brightness20: brightness20,
      brightness30: brightness30,
      brightness40: brightness40,
      brightness50: brightness50,
      brightness60: brightness60,
      brightness70: brightness70,
      brightness80: brightness80,
      brightness90: brightness90,
      darkness05: darkness05,
      darkness10: darkness10,
      darkness20: darkness20,
      darkness30: darkness30,
      darkness40: darkness40,
      darkness50: darkness50,
      darkness60: darkness60,
      darkness70: darkness70,
      darkness80: darkness80,
      darkness90: darkness90,
    ));
  }

  Color brightness(int percentage) {
    return swatch[-_i(percentage)] ?? Color(primary).brightness(percentage);
  }

  Color darkness(int percentage) {
    return swatch[_i(percentage)] ?? Color(primary).darkness(percentage);
  }

  Color get light => brightness(05);

  Color get dark => darkness(90);

  Color get holoLight => brightness(50);

  Color get holoDark => darkness(20);

  /// BRIGHT COLORS
  Color get b05 => brightness(05);

  Color get b10 => brightness(10);

  Color get b20 => brightness(20);

  Color get b30 => brightness(30);

  Color get b40 => brightness(40);

  Color get b50 => brightness(50);

  Color get b60 => brightness(60);

  Color get b70 => brightness(70);

  Color get b80 => brightness(80);

  Color get b90 => brightness(90);

  /// DARK COLORS
  Color get d05 => darkness(05);

  Color get d10 => darkness(10);

  Color get d20 => darkness(20);

  Color get d30 => darkness(30);

  Color get d40 => darkness(40);

  Color get d50 => darkness(50);

  Color get d60 => darkness(60);

  Color get d70 => darkness(70);

  Color get d80 => darkness(80);

  Color get d90 => darkness(90);

  /// TINT COLORS
  Color get tint50 => brightness(05);

  Color get tint100 => brightness(10);

  Color get tint200 => brightness(20);

  Color get tint300 => brightness(30);

  Color get tint400 => brightness(40);

  Color get tint500 => brightness(50);

  Color get tint600 => brightness(60);

  Color get tint700 => brightness(70);

  Color get tint800 => brightness(80);

  Color get tint900 => brightness(90);

  /// SHADE COLORS
  @override
  Color get shade50 => darkness(05);

  @override
  Color get shade100 => darkness(10);

  @override
  Color get shade200 => darkness(20);

  @override
  Color get shade300 => darkness(30);

  @override
  Color get shade400 => darkness(40);

  @override
  Color get shade500 => darkness(50);

  @override
  Color get shade600 => darkness(60);

  @override
  Color get shade700 => darkness(70);

  @override
  Color get shade800 => darkness(80);

  @override
  Color get shade900 => darkness(90);

  @override
  Color operator [](int index) {
    if (index < 0) {
      return swatch[-_i(index)] ?? Color(primary);
    } else {
      return swatch[_i(index)] ?? Color(primary);
    }
  }

  int _i(int i) {
    if (i <= 05) {
      return 05;
    } else if (i <= 10 || i == 100) {
      return 10;
    } else if (i <= 20 || i == 200) {
      return 20;
    } else if (i <= 30 || i == 300) {
      return 30;
    } else if (i <= 40 || i == 400) {
      return 40;
    } else if (i <= 50 || i == 500) {
      return 50;
    } else if (i <= 60 || i == 600) {
      return 60;
    } else if (i <= 70 || i == 700) {
      return 70;
    } else if (i <= 80 || i == 800) {
      return 80;
    } else {
      return 90;
    }
  }
}
