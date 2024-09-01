import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_project/pages/home_page.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open the Hive box
  var box = await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:
            const Color(0xFF4044C9), // Set your desired primary color here
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Color(0xFF4044C9), // Set AppBar color to match primary color
        ),
      ),
      home: const HomePage(),
    );
  }
}
