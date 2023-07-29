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
    var hexColor = AppColor.fromHex("#c7c7c7");
    return Scaffold(
      backgroundColor: hexColor,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: DefaultAppColors.red,
            margin: const EdgeInsets.all(90),
          ),
        ),
      ),
    );
  }
}
