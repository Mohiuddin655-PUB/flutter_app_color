import 'package:app_color/theme.dart';
import 'package:flutter/material.dart';

void main() {
  ColorTheme.init(
    // COLORS
    background: const ColorThemeConfig(
      light: ThemeColors(
        primary: Colors.green,
      ),
      dark: ThemeColors(
        primary: Colors.red,
      ),
    ),
    text: const ColorThemeConfig(
      light: ThemeColors(
        light: Colors.white,
        dark: Colors.black,
      ),
      dark: ThemeColors(
        light: Colors.black,
        dark: Colors.white,
      ),
    ),
    colors: [
      const ColorThemeData(
        name: "xyz",
        config: ColorThemeConfig(
          light: ThemeColors(
            primary: Colors.white24,
          ),
          dark: ThemeColors(
            primary: Colors.black26,
          ),
        ),
      ),
      //... add more color theme as custom
    ],
    // GRADIENTS
    backgroundGradient: GradientThemeConfig(
      light: ThemeGradients(
        primary: [
          Colors.white,
          Colors.grey.shade400,
        ],
      ),
      dark: ThemeGradients(
        primary: [
          Colors.black,
          Colors.grey.shade900,
        ],
      ),
    ),
    gradients: [
      GradientThemeData(
        name: "xyz",
        config: GradientThemeConfig(
          light: ThemeGradients(
            primary: [
              Colors.orange.shade400,
              Colors.red.shade400,
            ],
          ),
          dark: ThemeGradients(
            primary: [
              Colors.orange.shade900,
              Colors.red.shade900,
            ],
          ),
        ),
      ),
      //... add more gradient theme as custom
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: context.backgroundColor.primary,
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 200,
                color: context.colorOf("xyz").primary,
                alignment: Alignment.center,
                child: Text(
                  "SOLID COLOR",
                  style: TextStyle(
                    color: context.dark,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.backgroundGradient.primary ?? [],
                ),
              ),
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: context.gradientOf("xyz").primary ?? [],
                  ),
                ),
                child: const Text(
                  "GRADIENT COLOR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
