import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  ColorTheme.init(
    data: [
      const ColorThemeData(
        name: "scaffold",
        config: ColorThemeConfig(
          light: ThemeColors(
            primary: Colors.green,
          ),
          dark: ThemeColors(
            primary: Colors.red,
          ),
        ),
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: context.themeOf("scaffold").primary,
      ),
    );
  }
}
