import 'package:flutter/material.dart';

class SubPanel<T> extends StatelessWidget {
  const SubPanel(
      {Key key,
      @required this.title,
      @required this.values,
      @required this.builder})
      : super(key: key);

  final String title;
  final List<T> values;
  final Widget Function(T value) builder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Subtitle(title: title),
        ]..addAll(values.map((value) => builder(value))),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
