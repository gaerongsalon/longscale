import 'package:flutter/material.dart';

import '../model/until.dart';
import '../shared/format.dart';
import './card_icon.dart';

class UntilCard extends StatelessWidget {
  const UntilCard({
    Key key,
    @required this.until,
    @required this.birthDate,
  }) : super(key: key);

  final Until until;
  final String birthDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: _buildCardRow(),
      ),
    );
  }

  Widget _buildCardRow() {
    return Row(
      children: <Widget>[
        CardIcon(iconName: until.icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCardTitle(),
            _buildCardProgress(),
          ],
        ),
      ],
    );
  }

  Widget _buildCardTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: Text(until.label,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
        ),
        Text(
          formatDateFromString(until.date),
          style: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
      ]),
    );
  }

  Widget _buildCardProgress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(formatDDays(until.date)),
        Text(' ' + formatProgress(until.date, birthDate),
            style: TextStyle(fontSize: 12.0))
      ],
    );
  }
}
