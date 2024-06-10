import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/service.dart';

import 'movie/presentation/pages/home_page.dart';

void main() async {
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(useMaterial3: true).copyWith(),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(),
      home: const HomePage(),
    );
  }
}

