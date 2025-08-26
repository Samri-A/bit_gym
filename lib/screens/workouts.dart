import 'package:bit_gym/component/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:bit_gym/component/header.dart';
import 'package:bit_gym/services/workout.dart';
import 'package:gif_view/gif_view.dart';
import 'package:bit_gym/component/exercise_card.dart';

class Workouts extends StatefulWidget {
  final String id = "workouts";

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // search();
  }

  late bool is_loading = false;
  late List<dynamic> exercises = [];
  late String query;

  void search() async {
    var data = Workout().SearchWorkouts("waist");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextField(
              onChanged: (value) {
                query = value;
              },
              decoration: InputDecoration(
                hintText: "Exercises name or body part or  equipment",
                prefixIcon: IconButton(
                  onPressed: () async {
                    setState(() {
                      is_loading = true;
                    });
                    var data = await Workout().SearchWorkouts("waist");
                    setState(() {
                      exercises = data;
                      is_loading = false;
                    });
                  },
                  icon: Icon(Icons.search),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          is_loading
              ? CircularProgressIndicator()
              : exercises.isEmpty
              ? Center(child: Text("You do not have any exercises."))
              : ExerciseCard(exercises),
        ],
      ),
      bottomSheet: BottomNav(),
    );
  }
}
