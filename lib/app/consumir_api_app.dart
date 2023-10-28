import 'package:consumindo_api_flutter/pages/pages.dart';
import 'package:flutter/material.dart';

class ConsumirApiApp extends StatelessWidget {
  const ConsumirApiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo de API',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
