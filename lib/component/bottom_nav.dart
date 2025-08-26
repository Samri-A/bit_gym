import 'package:bit_gym/screens/friends.dart';
import 'package:bit_gym/screens/homepage.dart';
import 'package:bit_gym/screens/workouts.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Homepage().id);
            },
            child: Icon(Icons.home, color: Colors.black),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFF6366f1)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Workouts().id);
            },
            child: Icon(Icons.fitness_center, color: Colors.black),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Friends().id);
            },
            child: Icon(Icons.group, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
