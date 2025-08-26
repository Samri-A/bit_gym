import 'package:bit_gym/screens/auth_gate.dart';
import 'package:bit_gym/screens/friends.dart';
import 'package:bit_gym/screens/register.dart';
import 'package:bit_gym/screens/welcome_page.dart';
import 'package:bit_gym/screens/workouts.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/homepage.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      initialRoute: WelcomePage().id,
      routes: {
        WelcomePage().id: (context) => WelcomePage(),
        Homepage().id: (context) => Homepage(),
        Workouts().id: (context) => Workouts(),
        Friends().id: (context) => Friends(),
        AuthGate().id: (context) => AuthGate(),
        Register().id: (context) => Register(),
        Login().id: (context) => Login(),
      },
    );
  }
}
