import 'package:bit_gym/component/bottom_nav.dart';
import 'package:bit_gym/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bit_gym/component/header.dart';

class Homepage extends StatelessWidget {
  final String id = "homepage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Header,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(" 🔥Streak", style: kNormalTextStyle),
                      Text(
                        "12",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(" 🔥Streak", style: kNormalTextStyle),
                      Text(
                        "12",
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
