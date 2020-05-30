import 'package:flutter/material.dart';

import '../model/counter.dart';
import './card_icon.dart';

class CounterCard extends StatelessWidget {
  const CounterCard({Key key, @required this.counter, @required this.onAdd})
      : super(key: key);

  final Counter counter;
  final void Function(int) onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CardIcon(iconName: counter.icon),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildCounterTitle(),
                  _buildAddButtons(),
                ],
              ),
            ],
          )),
    );
  }

  Widget _buildCounterTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(counter.label, style: TextStyle(fontSize: 15.0)),
        Text('✌️${counter.count}✌️',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildAddButtons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _AddButton(value: 1, onAdd: onAdd),
          _AddButton(value: 10, onAdd: onAdd),
          _AddButton(value: 100, onAdd: onAdd)
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    Key key,
    @required this.value,
    @required this.onAdd,
  }) : super(key: key);

  final int value;
  final void Function(int) onAdd;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 72,
      child: FlatButton(
        child: Text('+$value'),
        onPressed: () => onAdd(value),
      ),
    );
  }
}
