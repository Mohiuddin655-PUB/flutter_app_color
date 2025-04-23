import 'package:app_color/extension.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final material = Color(0xFF4CAF50);
    final color = Colors.green;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: material,
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Colors.white,
                  material.shade50,
                  material.shade100,
                  material.shade200,
                  material.shade300,
                  material.shade400,
                  material.shade500,
                  material.shade600,
                  material.shade700,
                  material.shade800,
                  material.shade900,
                  Colors.black,
                ].map((e) {
                  return Expanded(
                    child: Container(
                      color: e,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ...List.generate(100, (i) => color.tint((i / 100)))
                      .map((e) {
                        return Expanded(
                          child: Container(
                            color: e,
                            width: double.infinity,
                          ),
                        );
                      })
                      .toList()
                      .reversed,
                  ...List.generate(100, (i) => color.shade((i / 100))).map((e) {
                    return Expanded(
                      child: Container(
                        color: e,
                        width: double.infinity,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
