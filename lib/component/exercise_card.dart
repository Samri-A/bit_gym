import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class ExerciseCard extends StatelessWidget {
  ExerciseCard(this.exercises);
  final List<dynamic> exercises;

  @override
  Widget build(BuildContext context) {
    if (exercises == null) {
      return Expanded(child: Center(child: Text("Try again")));
    }
    return Expanded(
      child: ListView.builder(
        itemCount: exercises.length - 1,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Container(
            child: Column(
              children: <Widget>[
                GifView.network(
                  'https://www.showmetech.com.br/wp-content/uploads/2015/09/happy-minion-gif.gif',
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Text('${exercise["name"]}'),
                Text('${exercise["bodyParts"]}'),
                Text('${exercise["targetMuscles"]}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
