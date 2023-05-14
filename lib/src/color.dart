part of '../app_color.dart';

class AppColor extends MaterialColor {
  final int primary;
  final Map<int, Color> swatch;

  const AppColor._(
    this.primary,
    this.swatch,
  ) : super(primary, swatch);

  factory AppColor._fromPalette(_Palette palette) {
    return AppColor._(palette.primary.value, palette.swatch);
  }

  factory AppColor.fromCode(
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
    return AppColor._fromPalette(_Palette.fromCode(
      primary,
      tint50: tint50,
      tint100: tint100,
      tint200: tint200,
      tint300: tint300,
      tint400: tint400,
      tint500: tint500,
      tint600: tint600,
      tint700: tint700,
      tint800: tint800,
      tint900: tint900,
      shade50: shade50,
      shade100: shade100,
      shade200: shade200,
      shade300: shade300,
      shade400: shade400,
      shade500: shade500,
      shade600: shade600,
      shade700: shade700,
      shade800: shade800,
      shade900: shade900,
    ));
  }

  factory AppColor.fromColor(
    Color primary, {
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
  }) {
    return AppColor._fromPalette(_Palette(
      primary: primary,
      tint50: tint50,
      tint100: tint100,
      tint200: tint200,
      tint300: tint300,
      tint400: tint400,
      tint500: tint500,
      tint600: tint600,
      tint700: tint700,
      tint800: tint800,
      tint900: tint900,
      shade50: shade50,
      shade100: shade100,
      shade200: shade200,
      shade300: shade300,
      shade400: shade400,
      shade500: shade500,
      shade600: shade600,
      shade700: shade700,
      shade800: shade800,
      shade900: shade900,
    ));
  }

  factory AppColor.fromHex(
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
    return AppColor._fromPalette(_Palette.fromHex(
      primary,
      tint50: tint50,
      tint100: tint100,
      tint200: tint200,
      tint300: tint300,
      tint400: tint400,
      tint500: tint500,
      tint600: tint600,
      tint700: tint700,
      tint800: tint800,
      tint900: tint900,
      shade50: shade50,
      shade100: shade100,
      shade200: shade200,
      shade300: shade300,
      shade400: shade400,
      shade500: shade500,
      shade600: shade600,
      shade700: shade700,
      shade800: shade800,
      shade900: shade900,
    ));
  }

  Color transparent(int percentage) => super.withOpacity(percentage / 100);

  Color darkness(int percentage) => swatch[_i(percentage)] ?? Color(primary);

  Color brightness(int percentage) => swatch[-_i(percentage)] ?? Color(primary);

  Color get light => brightness(90);

  Color get dark => darkness(90);

  Color get holoLight => brightness(50);

  Color get holoDark => darkness(20);

  Color get tint50 => brightness(5);

  Color get tint100 => brightness(10);

  Color get tint200 => brightness(20);

  Color get tint300 => brightness(30);

  Color get tint400 => brightness(40);

  Color get tint500 => brightness(50);

  Color get tint600 => brightness(60);

  Color get tint700 => brightness(70);

  Color get tint800 => brightness(80);

  Color get tint900 => brightness(90);

  @override
  Color get shade50 => swatch[50] ?? darkness(5);

  @override
  Color get shade100 => swatch[100] ?? darkness(10);

  @override
  Color get shade200 => swatch[200] ?? darkness(20);

  @override
  Color get shade300 => swatch[300] ?? darkness(30);

  @override
  Color get shade400 => swatch[400] ?? darkness(40);

  @override
  Color get shade500 => swatch[500] ?? darkness(50);

  @override
  Color get shade600 => swatch[600] ?? darkness(60);

  @override
  Color get shade700 => swatch[700] ?? darkness(70);

  @override
  Color get shade800 => swatch[800] ?? darkness(80);

  @override
  Color get shade900 => swatch[900] ?? darkness(90);

  @override
  Color operator [](int index) {
    if (index < 0) {
      return swatch[-_i(index)] ?? Color(primary);
    } else {
      return swatch[_i(index)] ?? Color(primary);
    }
  }

  int _i(int i) {
    if (i <= 05 || i == 50) {
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
