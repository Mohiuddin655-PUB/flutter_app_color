import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

/// Red Colors series from Hex Color codes
final redColors1 = AppColor.fromHex(
  "#F44336",
  tint50: "#F65549",
  tint100: "#F65549",
  tint200: "#F7675D",
  tint300: "#F87A71",
  tint400: "#F98C84",
  tint500: "#FA9F98",
  tint600: "#FBB2AD",
  tint700: "#FCC5C1",
  tint800: "#FDD8D5",
  tint900: "#FEEBEA",
  shade50: "#DC3C30",
  shade100: "#DC3C30",
  shade200: "#C4352B",
  shade300: "#AB2F26",
  shade400: "#932820",
  shade500: "#7A211B",
  shade600: "#621B16",
  shade700: "#491410",
  shade800: "#310D0B",
  shade900: "#180705",
); // Type color

/// Red Colors series from int color codes
final redColors2 = AppColor.fromCode(
  0xFFF44336,
  tint50: 0xFFF65549,
  tint100: 0xFFF65549,
  tint200: 0xFFF7675D,
  tint300: 0xFFF87A71,
  tint400: 0xFFF98C84,
  tint500: 0xFFFA9F98,
  tint600: 0xFFFBB2AD,
  tint700: 0xFFFCC5C1,
  tint800: 0xFFFDD8D5,
  tint900: 0xFFFEEBEA,
  shade50: 0xFFDC3C30,
  shade100: 0xFFDC3C30,
  shade200: 0xFFC4352B,
  shade300: 0xFFAB2F26,
  shade400: 0xFF932820,
  shade500: 0xFF7A211B,
  shade600: 0xFF621B16,
  shade700: 0xFF491410,
  shade800: 0xFF310D0B,
  shade900: 0xFF180705,
); // Type color

/// Red Colors series from custom red colors
final redColors3 = AppColor.fromColor(
  const Color(0xFFF44336),
  tint50: const Color(0xFFF65549),
  tint100: const Color(0xFFF65549),
  tint200: const Color(0xFFF7675D),
  tint300: const Color(0xFFF87A71),
  tint400: const Color(0xFFF98C84),
  tint500: const Color(0xFFFA9F98),
  tint600: const Color(0xFFFBB2AD),
  tint700: const Color(0xFFFCC5C1),
  tint800: const Color(0xFFFDD8D5),
  tint900: const Color(0xFFFEEBEA),
  shade50: const Color(0xFFDC3C30),
  shade100: const Color(0xFFDC3C30),
  shade200: const Color(0xFFC4352B),
  shade300: const Color(0xFFAB2F26),
  shade400: const Color(0xFF932820),
  shade500: const Color(0xFF7A211B),
  shade600: const Color(0xFF621B16),
  shade700: const Color(0xFF491410),
  shade800: const Color(0xFF310D0B),
  shade900: const Color(0xFF180705),
); // Type color

/// Red Medium Light color from redColors1 color series
final secondaryColor = redColors1.holoLight; // Type color

/// Red percentage valuable bright color from redColors2 color series
final lightThemeColor = redColors2.brightness(50); // Percentage value

/// Red percentage valuable dark color from redColors3 color series
final darkThemeColor = redColors3.darkness(50); // Percentage value
