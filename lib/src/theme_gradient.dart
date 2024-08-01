import 'package:flutter/material.dart';

import '../src/theme.dart';

class ThemeGradient<T extends Iterable<Color>> extends Iterable<Color> {
  final T light;
  final T dark;

  ThemeGradient({
    required this.light,
    T? dark,
  }) : dark = dark ?? light;

  T detect(bool darkMode) => darkMode ? dark : light;

  T theme(BuildContext context) => detect(context.isDarkMode);

  @override
  Iterator<Color> get iterator => light.iterator;
}
