import 'package:bit_gym/screens/auth_gate.dart';
import 'package:bit_gym/screens/friends.dart';
import 'package:bit_gym/screens/register.dart';
import 'package:bit_gym/screens/welcome_page.dart';
import 'package:bit_gym/screens/workouts.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'screens/homepage.dart';
import 'screens/login.dart';
import 'utils/constants.dart';
import 'screens/additional_info.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dotenv.env['url']!,
    anonKey: dotenv.env['anonKey']!,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: kButtonStyle),
      ),
      initialRoute: WelcomePage().id,
      routes: {
        WelcomePage().id: (context) => WelcomePage(),
        Homepage().id: (context) => Homepage(),
        Workouts().id: (context) => Workouts(),
        Friends().id: (context) => Friends(),
        AuthGate().id: (context) => AuthGate(),
        Register().id: (context) => Register(),
        Login().id: (context) => Login(),
        AdditionalInfo().id: (context) => const AdditionalInfo(),
      },
    );
  }
}
