import 'package:flutter/material.dart';

Future<String> asyncInputDialog(
    {@required BuildContext context,
    @required String title,
    @required String label,
    String defaultValue,
    String textOK = "OK"}) async {
  String userInput;
  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration:
                  new InputDecoration(labelText: label, hintText: defaultValue),
              onChanged: (value) {
                userInput = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(textOK),
            onPressed: () {
              Navigator.of(context).pop(userInput);
            },
          ),
        ],
      );
    },
  );
}
