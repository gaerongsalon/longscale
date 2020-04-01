import 'package:flutter/material.dart';

class UntilPage extends StatefulWidget {
  UntilPage({Key key}) : super(key: key);

  @override
  _UntilPageState createState() => _UntilPageState();
}

class _UntilPageState extends State<UntilPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: '뒤로가기',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 4,
        title: Text("롱-스케일 목표 날짜"),
      ),
      body: SafeArea(
          bottom: false,
          child: Expanded(
              child: Scrollbar(
            controller: this._scrollController,
            child: Text("BODY"),
          ))),
    );
  }
}
