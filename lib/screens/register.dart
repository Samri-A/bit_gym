import 'package:bit_gym/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:bit_gym/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login.dart';

class Register extends StatefulWidget {
  final String id = "register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  late String _email;

  late String _username;

  late String _password;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     vertical: 10.0,
            //     horizontal: 20,
            //   ),
            //   child: TextField(
            //     onChanged: (value) => _username = value,
            //     textAlign: TextAlign.center,
            //     decoration: kTextFieldDecoration.copyWith(hintText: "Username"),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Email", style: kNormalTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (value) => _email = value,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text("Password", style: kNormalTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                onChanged: (value) => _password = value,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: "Password"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: OutlinedButton(
                onPressed: () async {
                  try {
                    dynamic user = await _auth.createUserWithEmailAndPassword(
                      email: _email,
                      password: _password,
                    );
                    if (user != null)
                      Navigator.pushNamed(context, Homepage().id);
                    setState(() {
                      _isLoading = false;
                    });
                  } catch (e) {
                    setState(() {
                      _isLoading = false;
                    });
                    print(e);
                  }
                },
                style: kButtonStyle,
                child: Text("Register", style: TextStyle(color: Colors.black)),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "or contiue with",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            IconButton(
              onPressed: () async {
                try {
                  // final GoogleSignInAccount? googleUser = await _googleSignIn
                  //     .s();
                } catch (e) {
                  print(e);
                }
              },
              icon: FaIcon(FontAwesomeIcons.google),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Login().id);
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
