import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/app/modules/add_activity_module/add_acitivity.dart';
import 'package:todo_list/app/modules/home_modules/home_page.dart';
import 'package:todo_list/app/modules/splash_modules/splash_page.dart';
import 'package:todo_list/app/shared/data/database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ),
  );

  await AppDataBase().initDatabase();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/add_acitivity': (context) => const AddAcitivtyPage(),
      },
    );
  }
}
