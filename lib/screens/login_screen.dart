import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../components/my_hero.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MyHero(
                height: 200.0,
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email.',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                buttonTitle: 'Login',
                color: kLoginButtonColor,
                onPressed: () async {
                  //Implement login functionality.
//                  if (email == null) {
//                    Alert(
//                      context: context,
//                      type: AlertType.error,
//                      title: "Forgot something",
//                      desc: "You forgot enter email.",
//                      buttons: [
//                        DialogButton(
//                          child: Text(
//                            "OK",
//                            style: TextStyle(color: Colors.white, fontSize: 20),
//                          ),
//                          onPressed: () => Navigator.pop(context),
//                          width: 120,
//                        )
//                      ],
//                    ).show();
//                  } else if (password == null) {
//                    Alert(
//                      context: context,
//                      type: AlertType.error,
//                      title: "Forgot something",
//                      desc: "You forgot enter password.",
//                      buttons: [
//                        DialogButton(
//                          child: Text(
//                            "OK",
//                            style: TextStyle(color: Colors.white, fontSize: 20),
//                          ),
//                          onPressed: () => Navigator.pop(context),
//                          width: 120,
//                        )
//                      ],
//                    ).show();
//                  } else {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
