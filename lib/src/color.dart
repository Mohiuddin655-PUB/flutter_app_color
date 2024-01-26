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

  static final _white = {"x": 95.047, "y": 100, "z": 108.883};

  static int toCielab(double l, double a, double b, [double opacity = 1]) {
    final Map<String, double> xyz = {
      'x': a / 500 + (l + 16) / 116,
      'y': (l + 16) / 116,
      'z': (l + 16) / 116 - b / 200
    };

    xyz.forEach((key, value) {
      final cube = pow(value, 3);
      if (cube > 0.008856) {
        xyz[key] = cube as double;
      } else {
        xyz[key] = (value - 16 / 116) / 7.787;
      }
      xyz[key] = xyz[key]! * _white[key]!;
    });

    return toXYZ(xyz['x']!, xyz['y']!, xyz['z']!, opacity);
  }

  static int toHex(String hex) {
    String hexColor = hex.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  static int toHsl(double h, double s, double l, [double opacity = 1]) {
    List<double> rgb = [0, 0, 0];

    final double hue = h / 360 % 1;
    final double saturation = s / 100;
    final double luminance = l / 100;

    if (hue < 1 / 6) {
      rgb[0] = 1;
      rgb[1] = hue * 6;
    } else if (hue < 2 / 6) {
      rgb[0] = 2 - hue * 6;
      rgb[1] = 1;
    } else if (hue < 3 / 6) {
      rgb[1] = 1;
      rgb[2] = hue * 6 - 2;
    } else if (hue < 4 / 6) {
      rgb[1] = 4 - hue * 6;
      rgb[2] = 1;
    } else if (hue < 5 / 6) {
      rgb[0] = hue * 6 - 4;
      rgb[2] = 1;
    } else {
      rgb[0] = 1;
      rgb[2] = 6 - hue * 6;
    }

    rgb = rgb.map((val) => val + (1 - saturation) * (0.5 - val)).toList();

    if (luminance < 0.5) {
      rgb = rgb.map((val) => luminance * 2 * val).toList();
    } else {
      rgb = rgb.map((val) => luminance * 2 * (1 - val) + 2 * val - 1).toList();
    }

    final resultRgb = rgb.map((val) => (val * 255).round()).toList();

    return ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
            ((resultRgb[0] & 0xff) << 16) |
            ((resultRgb[1] & 0xff) << 8) |
            ((resultRgb[2] & 0xff) << 0)) &
        0xFFFFFFFF;
  }

  static int toXYZ(double x, double y, double z, [double opacity = 1]) {
    final double xp = x / 100;
    final double yp = y / 100;
    final double zp = z / 100;

    final Map<String, double> rgb = {
      'r': xp * 3.2406 + yp * -1.5372 + zp * -0.4986,
      'g': xp * -0.9689 + yp * 1.8758 + zp * 0.0415,
      'b': xp * 0.0557 + yp * -0.2040 + zp * 1.0570
    };

    final Map<String, int> resultRgb = {};

    rgb.forEach((key, value) {
      if (value > 0.0031308) {
        rgb[key] = 1.055 * pow(value, 1 / 2.4) - 0.055;
      } else {
        rgb[key] = value * 12.92;
      }
      resultRgb[key] = (rgb[key]! * 255).toInt();
    });

    return ((((opacity * 0xff ~/ 1) & 0xff) << 24) |
            ((resultRgb['r']! & 0xff) << 16) |
            ((resultRgb['g']! & 0xff) << 8) |
            ((resultRgb['b']! & 0xff) << 0)) &
        0xFFFFFFFF;
  }

  factory AppColor.fromCielab(
    double l,
    double a,
    double b, [
    double opacity = 1,
  ]) {
    return AppColor(toCielab(l, a, b, opacity));
  }

  factory AppColor.fromHex(String hex) => AppColor(toHex(hex));

  factory AppColor.fromHsl(double h, double s, double l, [double opacity = 1]) {
    return AppColor(toHsl(h, s, l, opacity));
  }

  factory AppColor.fromXYZ(double x, double y, double z, [double opacity = 1]) {
    return AppColor(toXYZ(x, y, z, opacity));
  }

  factory AppColor.fromCodes(
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

  factory AppColor.fromColors(
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

  factory AppColor.fromHexCodes(
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

  /// SHADE COLORS
  @override
  Color get shade50 => darker(05);

  @override
  Color get shade100 => darker(10);

  @override
  Color get shade200 => darker(20);

  @override
  Color get shade300 => darker(30);

  @override
  Color get shade400 => darker(40);

  @override
  Color get shade500 => darker(50);

  @override
  Color get shade600 => darker(60);

  @override
  Color get shade700 => darker(70);

  @override
  Color get shade800 => darker(80);

  @override
  Color get shade900 => darker(90);

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
