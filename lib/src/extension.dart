import 'package:flutter/material.dart';

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

  Color tx(double percentage) {
    assert(percentage >= 0 && percentage <= 100);
    return use.withOpacity(percentage / 100);
  }

  Color transparency(double percentage) => tx(percentage);

  bool get isDark {
    final base = this ?? Colors.transparent;
    int r = base.red;
    int g = base.green;
    int b = base.blue;
    final luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255;
    return luminance < 0.5;
  }

  Color auto(double percentage, [bool root = false]) {
    if (root) return isDark ? dx(percentage) : lx(percentage);
    return isDark ? lx(percentage) : dx(percentage);
  }

  Color lx(double percentage) {
    assert(percentage >= 0 && percentage <= 100);
    final x = (percentage / 100 * 255).round();
    final base = this ?? Colors.transparent;
    int r = base.red + x;
    int g = base.green + x;
    int b = base.blue + x;
    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (b > 255) b = 255;
    return Color.fromARGB(base.alpha, r, g, b);
  }

  Color lighter(double percentage) => lx(percentage);

  Color dx(double percentage) {
    assert(percentage >= 0 && percentage <= 100);
    final x = (percentage / 100 * 255).round();
    final base = this ?? Colors.transparent;
    int r = base.red - x;
    int g = base.green - x;
    int b = base.blue - x;
    if (r < 0) r = 0;
    if (g < 0) g = 0;
    if (b < 0) b = 0;
    return Color.fromARGB(base.alpha, r, g, b);
  }

  Color darker(double percentage) => dx(percentage);

  Color? mix(Color another, double amount) => Color.lerp(this, another, amount);

  String get asHex => '#${use.value.toRadixString(16).toUpperCase()}';

  int get asCode {
    var c = "0x${use.value.toRadixString(16)}";
    return int.tryParse(c) ?? 0x00000000;
  }
}

extension ColorContextExtension on BuildContext {
  bool get isDarkMode {
    final tb = Theme.of(this).brightness == Brightness.dark;
    final mb = MediaQuery.of(this).platformBrightness == Brightness.dark;
    return tb || mb;
  }

  Color get themeA => isDarkMode ? Colors.white : Colors.black;

  Color get themeB => isDarkMode ? Colors.black : Colors.white;

  Color theme(Color light, [Color? dark]) => isDarkMode ? dark ?? light : light;
}
