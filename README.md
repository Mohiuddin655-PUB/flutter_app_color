# app_color

Flutter package widening a Color class which can be used to create, convert, compare colors and uses
in UI. And also for working with editing color

```dart
// Usage hex from string and alternative color systems

void main() {
  AppColor.fromHex('000000'); // -> Color(0xFF000000)
  AppColor.fromHsl(164, 100, 88); // -> Color(0xFFC2FFEF)
  AppColor.fromXYZ(0.1669, 0.2293, 0.0434); // -> Color(0xFF659027)
  AppColor.fromCielab(36.80, 55.20, -95.61); // -> Color(0xFF4832F7)

  // Make color darker or lighter
  Color(0xFF000000).lighter(100); // -> Color(0xFFFFFFFF)
  Color(0xFF000000).darker(50); // -> Color(0xFF808080)

  // Mix with other colors
  Color(0xFFFF0000).mix(Color(0xFF00FF00), .25); // -> Color(0xFFBF3F00)

  // Colors conversion
  Color
      .fromRGBO(255, 255, 255, 1)
      .asHex; // -> '#FFFFFFFF'
}
```

## Getting Started

In your flutter project add the dependency:

```yaml
dependencies:
  app_color: any
```

## Examples

```dart
void main() {
  // HexColor
  assert(AppColor.fromHex('000000') == Color(0xFF000000));
  assert(AppColor.fromHex('#000000') == Color(0xFF000000));
  assert(AppColor.fromHex('FFFFFFFF') == Color(0xFFFFFFFF));
  assert(AppColor.fromHex('#B1000000') == Color(0xB1000000));
  assert(AppColor
      .fromHex('#B1000000')
      .asHex == '#B1000000');

  // HslColor
  assert(AppColor.fromHsl(164, 100, 88) == Color(0xFFC2FFEF));

  // HyzColor
  assert(AppColor.fromXYZ(0.1669, 0.2293, 0.0434) == Color(0xFF659027));

  // CielabColor
  assert(AppColor.fromCielab(36.80, 55.20, -95.61) == Color(0xFF4832F7));
}
```

*Make color darker or lighter*

```dart
void main() {
  // [black -> white] lighter by 100 percents
  assert(Color(0xFF000000).lighter(100) == Color(0xFFFFFFFF));
  assert(Color(0xFF000000).lx(100) == Color(0xFFFFFFFF));

  // Another lighter example
  assert(Color.fromARGB(255, 64, 64, 64).lighter(50) == Color.fromARGB(255, 192, 192, 192));
  assert(Color.fromARGB(255, 64, 64, 64).lx(50) == Color.fromARGB(255, 192, 192, 192));

  // [white -> grey] darker by 50 percents
  assert(Color(0xFF000000).darker(50) == Color(0xFF808080));
  assert(Color(0xFF000000).dx(50) == Color(0xFF808080));

  // Another darker example
  assert(Color.fromARGB(255, 192, 192, 192).darker(25) == Color.fromARGB(255, 128, 128, 128));
  assert(Color.fromARGB(255, 192, 192, 192).dx(25) == Color.fromARGB(255, 128, 128, 128));
}
```

# ListOfColors

```dart

import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

/// Red Colors series from Hex Color codes
final redColors1 = AppColor.fromHex(
  "#F44336",
  brightness05: "#F65549",
  brightness10: "#F65549",
  brightness20: "#F7675D",
  brightness30: "#F87A71",
  brightness40: "#F98C84",
  brightness50: "#FA9F98",
  brightness60: "#FBB2AD",
  brightness70: "#FCC5C1",
  brightness80: "#FDD8D5",
  brightness90: "#FEEBEA",
  darkness05: "#DC3C30",
  darkness10: "#DC3C30",
  darkness20: "#C4352B",
  darkness30: "#AB2F26",
  darkness40: "#932820",
  darkness50: "#7A211B",
  darkness60: "#621B16",
  darkness70: "#491410",
  darkness80: "#310D0B",
  darkness90: "#180705",
); // Type color

/// Red Colors series from int color codes
final redColors2 = AppColor.fromCode(
  0xFFF44336,
  brightness05: 0xFFF65549,
  brightness10: 0xFFF65549,
  brightness20: 0xFFF7675D,
  brightness30: 0xFFF87A71,
  brightness40: 0xFFF98C84,
  brightness50: 0xFFFA9F98,
  brightness60: 0xFFFBB2AD,
  brightness70: 0xFFFCC5C1,
  brightness80: 0xFFFDD8D5,
  brightness90: 0xFFFEEBEA,
  darkness05: 0xFFDC3C30,
  darkness10: 0xFFDC3C30,
  darkness20: 0xFFC4352B,
  darkness30: 0xFFAB2F26,
  darkness40: 0xFF932820,
  darkness50: 0xFF7A211B,
  darkness60: 0xFF621B16,
  darkness70: 0xFF491410,
  darkness80: 0xFF310D0B,
  darkness90: 0xFF180705,
); // Type color

/// Red Colors series from custom red colors
final redColors3 = AppColor.fromColor(
  const Color(0xFFF44336),
  brightness05: const Color(0xFFF65549),
  brightness10: const Color(0xFFF65549),
  brightness20: const Color(0xFFF7675D),
  brightness30: const Color(0xFFF87A71),
  brightness40: const Color(0xFFF98C84),
  brightness50: const Color(0xFFFA9F98),
  brightness60: const Color(0xFFFBB2AD),
  brightness70: const Color(0xFFFCC5C1),
  brightness80: const Color(0xFFFDD8D5),
  brightness90: const Color(0xFFFEEBEA),
  darkness05: const Color(0xFFDC3C30),
  darkness10: const Color(0xFFDC3C30),
  darkness20: const Color(0xFFC4352B),
  darkness30: const Color(0xFFAB2F26),
  darkness40: const Color(0xFF932820),
  darkness50: const Color(0xFF7A211B),
  darkness60: const Color(0xFF621B16),
  darkness70: const Color(0xFF491410),
  darkness80: const Color(0xFF310D0B),
  darkness90: const Color(0xFF180705),
); // Type color

/// Red Medium Light color from redColors1 color series
final secondaryColor = redColors1.holoLight; // Type color

/// Red percentage valuable bright color from redColors2 color series
final lightThemeColor = redColors2.brightness(50); // Percentage value

/// Red percentage valuable dark color from redColors3 color series
final darkThemeColor = redColors3.darkness(50); // Percentage value

```