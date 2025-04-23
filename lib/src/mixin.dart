import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

mixin ColorMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => color = ColorData.from(context));
    });
  }

  bool get isDarkMode => ColorTheme.isDarkMode(context);

  ThemeData get theme => Theme.of(context);

  ColorData color = ColorData.light;

  Color get green => color.green;

  Color get grey => color.grey;

  Color get blue => color.blue;

  Color get red => color.red;

  Color get orange => color.orange;

  Color get yellow => color.yellow;

  Color get purple => color.purple;

  Color get pink => color.pink;

  ThemeColors get base => color.base;

  Color get primary => base.primary ?? theme.primaryColor;

  Color get secondary => base.secondary ?? theme.colorScheme.secondary;

  Color get tertiary => base.tertiary ?? theme.colorScheme.tertiary;

  Color get light => base.light ?? (isDarkMode ? Colors.black : Colors.white);

  Color get lightAsFixed => base.lightAsFixed ?? Colors.white;

  Color get dark => base.dark ?? (isDarkMode ? Colors.white : Colors.black);

  Color get darkAsFixed => base.darkAsFixed ?? Colors.black;

  Color get mid => base.mid ?? grey;

  Color get holo => base.holo ?? (isDarkMode ? grey.shade700 : grey.shade200);

  Color get soft => base.soft ?? (isDarkMode ? grey.shade900 : grey.shade100);

  Color get deep => base.deep ?? (isDarkMode ? grey.shade200 : grey.shade700);

  Color get disable {
    return base.disable ?? (isDarkMode ? grey.shade400 : grey.shade600);
  }

  Color get error => base.error ?? (isDarkMode ? red.shade600 : red.shade400);

  Color get warning {
    return base.warning ?? (isDarkMode ? orange.shade600 : orange.shade400);
  }

  ThemeColors get appbarColor => color.appbar;

  ThemeColors get backgroundColor => color.background;

  ThemeColors get bottomColor => color.bottom;

  ThemeColors get cardColor => color.card;

  ThemeColors get dialogColor => color.dialog;

  ThemeColors get dividerColor => color.divider;

  ThemeColors get highlightColor => color.highlight;

  ThemeColors get hintColor => color.hint;

  ThemeColors get hoverColor => color.hover;

  ThemeColors get iconColor => color.icon;

  ThemeColors get labelColor => color.label;

  ThemeColors get placeholder => color.placeholder;

  ThemeColors get scaffoldColor => color.scaffold;

  ThemeColors get shadowColor => color.shadow;

  ThemeColors get splashColor => color.splash;

  ThemeColors get surfaceColor => color.surface;

  ThemeColors get textColor => color.text;

  ThemeColors colorOf(String name) => color.colorOf(name);

  ThemeGradients gradientOf(String name) => color.gradientOf(name);
}
