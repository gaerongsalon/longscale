import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:longscale/main/event.dart';

import '../model/counter.dart';
import '../model/document.dart';
import './counter_card.dart';
import './profile_card.dart';
import './tab_view.dart';
import './sub_panel.dart';
import './until_card.dart';

class DashboardTabBuilder extends TabViewBuilder {
  final BottomNavigationBarItem navigationItem = const BottomNavigationBarItem(
    title: Text("대시보드"),
    icon: const Icon(Icons.dashboard),
  );

  Widget build(BuildContext context, EventBus bus, Document document) {
    return _DashboardTabView(document: document, bus: bus);
  }
}

class _DashboardTabView extends StatelessWidget {
  _DashboardTabView({
    Key key,
    @required this.document,
    @required this.bus,
  }) : super(key: key);

  final Document document;
  final EventBus bus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileCard(profile: document.profile),
            _buildBody()
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildUntilBody(), _buildCounterBody()]),
      ),
    );
  }

  Widget _buildUntilBody() {
    return SubPanel(
        title: '🏁 자라나고 있어요!',
        values: document.untils,
        builder: (value) => UntilCard(
              until: value,
              birthDate: document.profile.birthDate,
            ));
  }

  Widget _buildCounterBody() {
    return SubPanel(
        title: '👏 마음수련 터치터치!',
        values: document.counters,
        builder: (Counter value) => CounterCard(
            counter: value,
            onAdd: (incr) =>
                bus.fire(IncrementCounter(counterId: value.id, delta: incr))));
  }
}
