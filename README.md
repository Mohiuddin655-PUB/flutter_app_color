# app_color

Flutter package widening a Color class which can be used to create, convert, compare colors and uses
in UI. And also for working with editing color

## Getting Started

In your flutter project add the dependency:

```yaml
dependencies:
  app_color: ^1.0.1
```

## Examples

```dart
void main() {
  // HexColor
  assert(AppColor.fromHex('000000') == Color(0xFF000000));
  assert(AppColor.fromHex('#000000') == Color(0xFF000000));
  assert(AppColor.fromHex('FFFFFFFF') == Color(0xFFFFFFFF));
  assert(AppColor.fromHex('#B1000000') == Color(0xB1000000));
  assert(AppColor
      .fromHex('#B1000000')
      .asHex == '#B1000000');

  // HslColor
  assert(AppColor.fromHsl(164, 100, 88) == Color(0xFFC2FFEF));

  // HyzColor
  assert(AppColor.fromXYZ(0.1669, 0.2293, 0.0434) == Color(0xFF659027));

  // CielabColor
  assert(AppColor.fromCielab(36.80, 55.20, -95.61) == Color(0xFF4832F7));
}
```

*Make color darker or lighter*

```dart
void main() {
  // [black -> white] lighter by 100 percents
  assert(Color(0xFF000000).lighter(100) == Color(0xFFFFFFFF));
  assert(Color(0xFF000000).lx(100) == Color(0xFFFFFFFF));

  // Another lighter example
  assert(Color.fromARGB(255, 64, 64, 64).lighter(50) == Color.fromARGB(255, 192, 192, 192));
  assert(Color.fromARGB(255, 64, 64, 64).lx(50) == Color.fromARGB(255, 192, 192, 192));

  // [white -> grey] darker by 50 percents
  assert(Color(0xFF000000).darker(50) == Color(0xFF808080));
  assert(Color(0xFF000000).dx(50) == Color(0xFF808080));

  // Another darker example
  assert(Color.fromARGB(255, 192, 192, 192).darker(25) == Color.fromARGB(255, 128, 128, 128));
  assert(Color.fromARGB(255, 192, 192, 192).dx(25) == Color.fromARGB(255, 128, 128, 128));
}
```

## COLOR THEME
```dart

import 'package:app_color/theme.dart';
import 'package:flutter/material.dart';

void main() {
  ColorInitializer(
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
  ).createInstance();
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
```

## COLOR CUSTOMIZATION
```dart
import 'package:app_color/helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Container(
                      color: Colors.white.dx(10),
                      alignment: Alignment.center,
                      child: const Text("DARK 10%"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                width: double.infinity,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Container(
                      color: Colors.black.lx(10),
                      alignment: Alignment.center,
                      child: const Text(
                        "LIGHT 10%",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green.shade400,
                      width: double.infinity,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Colors.green.shade400.themeA(10),
                            margin: const EdgeInsets.all(32),
                            alignment: Alignment.center,
                            child: Text(
                              "AUTO 10%\nDETECT ON COLOR \nBRIGHTNESS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green.shade400.themeB(75),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green.shade600,
                      width: double.infinity,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            color: Colors.green.shade600.themeA(10),
                            margin: const EdgeInsets.all(32),
                            alignment: Alignment.center,
                            child: Text(
                              "AUTO 10%\nDETECT ON COLOR \nBRIGHTNESS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green.shade600.themeB(75),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```