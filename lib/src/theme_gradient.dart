import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeGradient<T extends Iterable<Color>> extends Iterable<Color> {
  final T light;
  final T dark;

  ThemeGradient({
    required this.light,
    T? dark,
  }) : dark = dark ?? light;

  T of(BuildContext context) => detect(context.isDarkMode);

  T detect(bool darkMode) => darkMode ? dark : light;

  @override
  Iterator<Color> get iterator => light.iterator;
}
