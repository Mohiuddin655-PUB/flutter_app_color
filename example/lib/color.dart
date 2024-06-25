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
                            color: Colors.green.shade400.auto(10),
                            margin: const EdgeInsets.all(32),
                            alignment: Alignment.center,
                            child: Text(
                              "AUTO 10%\nDETECT ON COLOR \nBRIGHTNESS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green.shade400.auto(75, true),
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
                            color: Colors.green.shade600.auto(10),
                            margin: const EdgeInsets.all(32),
                            alignment: Alignment.center,
                            child: Text(
                              "AUTO 10%\nDETECT ON COLOR \nBRIGHTNESS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green.shade600.auto(75, true),
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
