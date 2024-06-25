import 'package:flutter/material.dart';

import '../src/theme.dart';

class ThemeColor<T extends Color> extends Color {
  final T light;
  final T dark;

  ThemeColor({
    required this.light,
    T? dark,
  })  : dark = dark ?? light,
        super(light.value);

  T detect(bool darkMode) => darkMode ? dark : light;

  T theme(BuildContext context) => detect(context.isDarkMode);
}
