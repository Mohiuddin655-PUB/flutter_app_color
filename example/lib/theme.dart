import 'package:app_color/theme.dart';
import 'package:flutter/material.dart';

void main() {
  ColorTheme(
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
        primary: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.shade400,
          ],
        ),
      ),
      dark: ThemeGradients(
        primary: LinearGradient(
          colors: [
            Colors.white,
            Colors.grey.shade400,
          ],
        ),
      ),
    ),
    gradients: [
      GradientThemeData(
        name: "xyz",
        config: GradientThemeConfig(
          light: ThemeGradients(
            primary: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey.shade400,
              ],
            ),
          ),
          dark: ThemeGradients(
            primary: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey.shade400,
              ],
            ),
          ),
        ),
      ),
      //... add more gradient theme as custom
    ],
  ).apply();
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
      home: const NormalImplement(),
    );
  }
}

class NormalImplement extends StatelessWidget {
  const NormalImplement({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeColor = ColorData.from(context);
    // final themeColor = context.color;
    // final lightColor = ColorData.of(false);
    // final darkColor = ColorData.of(true);
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
                gradient: context.backgroundGradient.primary,
              ),
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: context.gradientOf("xyz").primary,
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

class ImplementWithMixin extends StatefulWidget {
  const ImplementWithMixin({super.key});

  @override
  State<ImplementWithMixin> createState() => _ImplementWithMixinState();
}

class _ImplementWithMixinState extends State<ImplementWithMixin>
    with ColorMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: red,
      child: Text(
        "Text color",
        style: TextStyle(
          color: textColor.primary,
        ),
      ),
    );
  }
}
