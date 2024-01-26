part of '../app_color.dart';

extension ColorHelper on Color? {
  Color get use => this ?? Colors.transparent;

  Color get dark => dx(95);

  Color get light => lx(95);

  Color get holoDark => dx(90);

  Color get holoLight => lx(90);

  /// BRIGHTNESS
  Color get l01 => lx(01);

  Color get l02 => lx(02);

  Color get l05 => lx(05);

  Color get l10 => lx(10);

  Color get l15 => lx(15);

  Color get l20 => lx(20);

  Color get l25 => lx(25);

  Color get l30 => lx(30);

  Color get l40 => lx(40);

  Color get l50 => lx(50);

  Color get l60 => lx(60);

  Color get l70 => lx(70);

  Color get l75 => lx(75);

  Color get l80 => lx(80);

  Color get l85 => lx(85);

  Color get l90 => lx(90);

  Color get l95 => lx(95);

  Color get l98 => lx(98);

  Color get l99 => lx(99);

  /// DARKNESS
  Color get d01 => dx(01);

  Color get d02 => dx(02);

  Color get d05 => dx(05);

  Color get d10 => dx(10);

  Color get d15 => dx(15);

  Color get d20 => dx(20);

  Color get d25 => dx(25);

  Color get d30 => dx(30);

  Color get d40 => dx(40);

  Color get d50 => dx(50);

  Color get d60 => dx(60);

  Color get d70 => dx(70);

  Color get d75 => dx(75);

  Color get d80 => dx(80);

  Color get d85 => dx(85);

  Color get d90 => dx(90);

  Color get d95 => dx(95);

  Color get d98 => dx(98);

  Color get d99 => dx(99);

  /// TRANSPARENT
  Color get t01 => tx(01);

  Color get t02 => tx(02);

  Color get t05 => tx(05);

  Color get t10 => tx(10);

  Color get t15 => tx(15);

  Color get t20 => tx(20);

  Color get t25 => tx(25);

  Color get t30 => tx(30);

  Color get t40 => tx(40);

  Color get t50 => tx(50);

  Color get t60 => tx(60);

  Color get t70 => tx(70);

  Color get t75 => tx(75);

  Color get t80 => tx(80);

  Color get t85 => tx(85);

  Color get t90 => tx(90);

  Color get t95 => tx(95);

  Color get t98 => tx(98);

  Color get t99 => tx(99);

  Color tx(int percentage) {
    assert(percentage >= 1 && percentage <= 100);
    return use.withOpacity(percentage / 100);
  }

  Color transparency(int percentage) => tx(percentage);

  Color lx(int percentage) {
    assert(percentage >= 1 && percentage <= 100);
    final int rgbPercent = (percentage / 100 * 255).round();

    int red = use.red + rgbPercent;
    int green = use.green + rgbPercent;
    int blue = use.blue + rgbPercent;

    if (red > 255) {
      red = 255;
    }
    if (green > 255) {
      green = 255;
    }
    if (blue > 255) {
      blue = 255;
    }
    return Color.fromARGB(use.alpha, red, green, blue);
  }

  Color lighter(int percentage) => lx(percentage);

  Color dx(int percentage) {
    assert(percentage >= 1 && percentage <= 100);
    final int rgbPercent = (percentage / 100 * 255).round();

    int red = use.red - rgbPercent;
    int green = use.green - rgbPercent;
    int blue = use.blue - rgbPercent;

    if (red < 0) {
      red = 0;
    }
    if (green < 0) {
      green = 0;
    }
    if (blue < 0) {
      blue = 0;
    }
    return Color.fromARGB(use.alpha, red, green, blue);
  }

  Color darker(int percentage) => dx(percentage);

  Color? mix(Color another, double amount) => Color.lerp(this, another, amount);

  String get asHex => '#${use.value.toRadixString(16).toUpperCase()}';

  int get asCode {
    var c = "0x${use.value.toRadixString(16)}";
    return int.tryParse(c) ?? 0x00000000;
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

extension ColorContextExtension on BuildContext {
  bool get isDark => MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  Color get themeWhite => isDark ? Colors.black : Colors.white;

  Color get themeBlack => isDark ? Colors.white : Colors.black;

  Color theme(ThemeColor color) => isDark ? color.light : color.dark;
}
