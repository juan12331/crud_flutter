import 'package:flutter/material.dart';

import 'pages/login.dart';
// import 'pages/cadastro.dart';
// import 'pages/home.dart';
// import 'pages/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        
        useMaterial3: true,
      ),
      routes: {
         '/': (context) => const Login(),
        
      },
    );
  }
}