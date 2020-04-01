import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../shared/page_names.dart';
import '../shared/preference.dart';
import './google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = PageNames.login;

  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _authenticating = true;

  @override
  void initState() {
    super.initState();
    getGoogleSignIn().signInSilently().then((previous) {
      if (previous == null) {
        getGoogleSignIn().signIn().then((account) {
          if (account == null) {
            this.setState(() {
              this._authenticating = false;
            });
          } else {
            this._warmUpAndStart(account);
          }
        });
      } else {
        this._warmUpAndStart(previous);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._authenticating) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/images/avatar.png', width: 240),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/avatar.png', width: 240),
              RaisedButton(
                child: Text('로그인'),
                onPressed: () {
                  print('로그인');
                },
              )
            ],
          ),
        ),
      );
    }
  }

  Future<void> _warmUpAndStart(GoogleSignInAccount account) async {
    await Preference().warmUp(account);
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed(PageNames.dashboard);
  }
}
