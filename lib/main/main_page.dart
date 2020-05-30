import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../login/waiting_view.dart';
import '../model/document.dart';
import './dashboard_tab.dart';
import './event.dart';
import './until_tab.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _bucket = PageStorageBucket();
  final _bus = EventBus();
  final _tabBuilders = [DashboardTabBuilder(), UntilTabBuilder()];

  Document _document;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // Step 1. Fetch a document id from email address.
    // Step 2. Load a document using that id.
    this.setState(() {
      _document = buildDemoDocument();
    });
    _bus.on<NewUntil>().listen((event) {
      setState(() {
        _document.untils.add(event.until);
      });
      print(event.runtimeType.toString());
    });
    _bus.on<IncrementCounter>().listen((event) {
      setState(() {
        _document.counters.firstWhere((c) => c.id == event.counterId).count +=
            event.delta;
      });
      print(event.runtimeType.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_document == null) {
      return WaitingView();
    }
    var currentTb = _tabBuilders[_currentTabIndex];
    print('$_currentTabIndex');
    return Scaffold(
      key: this._scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: PageStorage(
            child: currentTb.build(context, _bus, _document), bucket: _bucket),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: _tabBuilders.map((tb) => tb.navigationItem).toList(),
        currentIndex: this._currentTabIndex,
      ),
      floatingActionButton: currentTb.showFloatingActionButton
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => currentTb.onAdd(context, _bus),
            )
          : null,
    );
  }
}
