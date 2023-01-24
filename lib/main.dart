import 'package:examen_practic/preferences/preferences.dart';
import 'package:examen_practic/providers/db_provider.dart';
import 'package:examen_practic/providers/despeses_list_provider.dart';
import 'package:examen_practic/screens/add_page.dart';
import 'package:examen_practic/screens/home_page.dart';
import 'package:examen_practic/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DespesesListProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'home': (_) => HomePage(),
        'add': (_) => AddPage(),
      },
    );
  }
}
