import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../shared/page_names.dart';
import '../shared/preference.dart';
import './google_sign_in.dart';
import './waiting_view.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = PageNames.login;

  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    getGoogleSignIn().signInSilently().then((previous) {
      if (previous == null) {
        getGoogleSignIn().signIn().then((account) {
          if (account == null) {
            this.setState(() {});
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
    return WaitingView();
  }

  Future<void> _warmUpAndStart(GoogleSignInAccount account) async {
    await Preference().warmUp(account);
    Navigator.of(context).pushReplacementNamed(PageNames.main);
  }
}
