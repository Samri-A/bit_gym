import 'package:flutter/material.dart';
import 'package:bit_gym/services/networking.dart';

class Workout {
  String _url = "https://exercisedb-api.vercel.app/api/v1/exercises";
  Future<dynamic> SearchWorkouts(query) async {
    String url = "$_url/filter?$query";
    var data = NetworkHelp(url).getData();
    return data;
  }
}
