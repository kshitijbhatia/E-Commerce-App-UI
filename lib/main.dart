import 'package:e_commerce_app/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
