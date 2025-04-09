import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeColor<T extends Color> extends Color {
  final T light;
  final T dark;

  ThemeColor({
    required this.light,
    T? dark,
  })  : dark = dark ?? light,
        super(light.toARGB32());

  T of(BuildContext context) => detect(context.isDarkMode);

  T detect(bool darkMode) => darkMode ? dark : light;
}
