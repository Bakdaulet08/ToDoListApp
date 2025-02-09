import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_page.dart';

void main() async {
  // Инициализация Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Открытие коробки
  await Hive.openBox('myBox');

  // Запуск приложения
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/homePage': (context) => HomePage(),
      },
    );
  }
}
