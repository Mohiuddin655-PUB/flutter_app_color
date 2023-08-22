part of '../app_color.dart';

extension ColorExtension on Color {
  /// BRIGHTNESS
  Color get b01 => brightness(01);

  Color get b02 => brightness(02);

  Color get b05 => brightness(05);

  Color get b10 => brightness(10);

  Color get b15 => brightness(15);

  Color get b20 => brightness(20);

  Color get b25 => brightness(25);

  Color get b30 => brightness(30);

  Color get b40 => brightness(40);

  Color get b50 => brightness(50);

  Color get b60 => brightness(60);

  Color get b70 => brightness(70);

  Color get b75 => brightness(75);

  Color get b80 => brightness(80);

  Color get b85 => brightness(85);

  Color get b90 => brightness(90);

  Color get b95 => brightness(95);

  Color get b98 => brightness(98);

  Color get b99 => brightness(99);

  /// DARKNESS
  Color get d01 => darkness(01);

  Color get d02 => darkness(02);

  Color get d05 => darkness(05);

  Color get d10 => darkness(10);

  Color get d15 => darkness(15);

  Color get d20 => darkness(20);

  Color get d25 => darkness(25);

  Color get d30 => darkness(30);

  Color get d40 => darkness(40);

  Color get d50 => darkness(50);

  Color get d60 => darkness(60);

  Color get d70 => darkness(70);

  Color get d75 => darkness(75);

  Color get d80 => darkness(80);

  Color get d85 => darkness(85);

  Color get d90 => darkness(90);

  Color get d95 => darkness(95);

  Color get d98 => darkness(98);

  Color get d99 => darkness(99);

  /// TRANSPARENT
  Color get t01 => transparent(01);

  Color get t02 => transparent(02);

  Color get t05 => transparent(05);

  Color get t10 => transparent(10);

  Color get t15 => transparent(15);

  Color get t20 => transparent(20);

  Color get t25 => transparent(25);

  Color get t30 => transparent(30);

  Color get t40 => transparent(40);

  Color get t50 => transparent(50);

  Color get t60 => transparent(60);

  Color get t70 => transparent(70);

  Color get t75 => transparent(75);

  Color get t80 => transparent(80);

  Color get t85 => transparent(85);

  Color get t90 => transparent(90);

  Color get t95 => transparent(95);

  Color get t98 => transparent(98);

  Color get t99 => transparent(99);
}

extension ColorBuilderExtension on Color {
  Color get dark => darkness(95);

  Color get light => brightness(95);

  Color get holoDark => darkness(90);

  Color get holoLight => brightness(90);

  Color brightness(int percentage) {
    var color = this;
    var factor = percentage / 100;
    return Color.fromARGB(
      color.alpha,
      (color.red + (255 - color.red) * factor).round().clamp(0, 255),
      (color.green + (255 - color.green) * factor).round().clamp(0, 255),
      (color.blue + (255 - color.blue) * factor).round().clamp(0, 255),
    );
  }

  Color darkness(int percentage) {
    var color = this;
    var factor = percentage / 100;
    return Color.fromARGB(
      color.alpha,
      (color.red * (1 - factor)).round().clamp(0, 255),
      (color.green * (1 - factor)).round().clamp(0, 255),
      (color.blue * (1 - factor)).round().clamp(0, 255),
    );
  }

  Color transparent(int percentage) => withOpacity(percentage / 100);

  String get hex => value.toRadixString(16).substring(2);

  int get code {
    var c = "0x${value.toRadixString(16)}";
    return int.tryParse(c) ?? 0;
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
