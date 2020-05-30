import 'package:flutter/material.dart';

import '../shared/icons.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key key,
    @required this.iconName,
  }) : super(key: key);

  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: CircleAvatar(
        child: Icon(resolveIcon(iconName)),
      ),
    );
  }
}
