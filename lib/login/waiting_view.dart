import 'package:flutter/material.dart';

class WaitingView extends StatefulWidget {
  WaitingView({Key key}) : super(key: key);

  @override
  _WaitingViewState createState() => _WaitingViewState();
}

class _WaitingViewState extends State<WaitingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/avatar.png', width: 240),
      ),
    );
  }
}
