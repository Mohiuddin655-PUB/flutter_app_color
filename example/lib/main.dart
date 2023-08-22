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
    var color = const Color(0xff060511);
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
                    color: color.holoLight,
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
                    color: color.holoDark,
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
