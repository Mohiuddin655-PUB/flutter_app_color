# flutter_colors

# use 
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


Collection of color with advanced controlling system.
