import 'package:bit_gym/component/header.dart';
import 'package:flutter/material.dart';
import 'package:bit_gym/component/bottom_nav.dart';

class Friends extends StatelessWidget {
  const Friends({super.key});
  final String id = "friends";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.share),
      ),
      body: Column(
        children: <Widget>[Center(child: Text("You dont have Friends yet."))],
      ),
      bottomSheet: BottomNav(),
    );
  }
}
