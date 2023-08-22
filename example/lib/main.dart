import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HEX COLOR
    var hexColor = const Color(0xff0d0c22); // dark black color
    // var hexColor = const Color(0xff9e9ea7); // grey color
    debugPrint(hexColor.hex);
    debugPrint(hexColor.dark.hex);
    debugPrint(hexColor.holoDark.hex);
    debugPrint(hexColor.light.hex);
    debugPrint(hexColor.holoLight.hex);
    return Scaffold(
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
                    color: hexColor.holoLight,
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
                    color: hexColor.holoDark,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
