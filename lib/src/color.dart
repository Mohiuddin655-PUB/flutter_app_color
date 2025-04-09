import 'dart:math';

import 'package:flutter/material.dart';

import 'helper.dart';

class AppColor extends MaterialColor {
  final int primary;

  const AppColor(this.primary) : super(primary, const {});

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

  /// SHADE COLORS
  @override
  Color get shade50 => lx(05);

  @override
  Color get shade100 => lx(10);

  @override
  Color get shade200 => lx(20);

  @override
  Color get shade300 => lx(30);

  @override
  Color get shade400 => lx(40);

  @override
  Color get shade500 => dx(50);

  @override
  Color get shade600 => dx(60);

  @override
  Color get shade700 => dx(70);

  @override
  Color get shade800 => dx(80);

  @override
  Color get shade900 => dx(90);

  @override
  Color operator [](int key) {
    if (key < 0) {
      return dx(min(max(key < -100 ? key / 10 : key * -1.0, 0), 100));
    } else {
      return lx(min(max(key > 100 ? key / 10 : key * 1.0, 0), 100));
    }
  }
}
