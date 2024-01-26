part of '../app_color.dart';

class ThemeColor<T extends Color> extends Color {
  final T light;
  final T dark;

  ThemeColor({
    required this.light,
    T? dark,
  })  : dark = dark ?? light,
        super(light.value);

  T detect([bool darkMode = false]) => darkMode ? dark : light;

  T theme(BuildContext context) => context.isDark ? light : dark;
}
