import 'package:flutter/material.dart';
import 'package:bit_gym/screens/homepage.dart';
import 'package:bit_gym/screens/friends.dart';
import 'package:bit_gym/screens/workouts.dart';

class MyHomePage extends StatefulWidget {
  final String id = "myhomepage";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [Homepage(), Workouts(), Friends()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: " "),
        ],
        selectedItemColor: Color(0xFF6366f1),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
