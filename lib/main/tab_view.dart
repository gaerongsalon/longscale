import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../model/document.dart';

abstract class TabViewBuilder {
  BottomNavigationBarItem get navigationItem;

  bool get showFloatingActionButton => false;

  Widget build(BuildContext context, EventBus bus, Document document);

  void onAdd(BuildContext context, EventBus bus) {}
}
