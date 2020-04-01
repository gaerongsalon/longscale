import "package:flutter/material.dart";

import "../model/counter.dart";
import "../model/dashboard.dart";
import "../model/profile.dart";
import "../model/until.dart";
import "../shared/format.dart";

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  Dashboard _dashboard;

  @override
  void initState() {
    super.initState();
    // Step 1. Fetch a document id from email address.
    // Step 2. Load a document using that id.
    this.setState(() {
      _dashboard = new Dashboard(id: "test-dashboard");
      _dashboard.profile = Profile(id: "abc");
      _dashboard.profile.name = "롱롱이";
      _dashboard.profile.pictureUrl = "";
      _dashboard.profile.birthDate = "2020-04-01";

      _dashboard.counters = [
        Counter(
            id: "a1",
            label: "잘자라 우리롱롱~",
            icon: "airline_seat_flat",
            date: "2020-03-31",
            count: 123),
        Counter(
            id: "a2",
            label: "맛나게 먹자~",
            icon: "local_drink",
            date: "2020-03-31",
            count: 123),
        Counter(
            id: "a3",
            label: "어화둥둥",
            icon: "child_care",
            date: "2020-03-31",
            count: 123),
        Counter(
            id: "a4",
            label: "잘먹고 트름하기!",
            icon: "airline_seat_recline_extra",
            date: "2020-03-31",
            count: 123),
      ];
      _dashboard.untils = [
        Until(
            id: "x1", label: "첫 번째 도약기", icon: "favorite", date: "2020-05-05"),
        Until(
            id: "x2",
            label: "두 번째 도약기",
            icon: "audiotrack",
            date: "2020-05-25"),
        Until(
            id: "x3",
            label: "세 번째 도약기",
            icon: "brightness_2",
            date: "2020-07-05"),
      ];
    });
  }

  IconData _resolveIcon(String iconName) {
    switch (iconName) {
      case "airline_seat_flat":
        return Icons.airline_seat_flat;
      case "local_drink":
        return Icons.local_drink;
      case "child_care":
        return Icons.child_care;
      case "airline_seat_recline_extra":
        return Icons.airline_seat_recline_extra;
      case "favorite":
        return Icons.favorite;
      case "audiotrack":
        return Icons.audiotrack;
      case "brightness_2":
        return Icons.brightness_2;
    }
    return Icons.account_circle;
  }

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: SafeArea(
          bottom: false,
          child: Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: SingleChildScrollView(
              child: this._buildDashboardView(),
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Dashboard", style: TextStyle(fontSize: 11.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("Progress", style: TextStyle(fontSize: 11.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care),
              title: Text("Behavior", style: TextStyle(fontSize: 11.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              title: Text("Photos", style: TextStyle(fontSize: 11.0))),
        ],
        currentIndex: this._currentTabIndex,
      ),
    );
  }

  Widget _buildDashboardView() {
    if (_dashboard == null) {
      return Center(child: Text("불러오는 중"));
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0 + 8.0, bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    child: Image.asset("assets/images/avatar.png", width: 100),
                    radius: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(_dashboard.profile.name,
                              style: TextStyle(fontSize: 24.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                              "🧡 " +
                                  formatDateFromString(
                                      _dashboard.profile.birthDate),
                              style: TextStyle(color: Colors.black87)),
                        ),
                        Text(formatAge(_dashboard.profile.birthDate),
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black87)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]..add(Card(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 24.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("🏁 그 날이 오면!",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]
                    ..addAll(_dashboard.untils.map((until) {
                      return Card(
                        elevation: 3.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black45,
                                  child: Icon(_resolveIcon(until.icon)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Row(children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 6.0),
                                        child: Text(until.label,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        formatDateFromString(until.date),
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey),
                                      ),
                                    ]),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(formatDDays(until.date)),
                                      Text(
                                          " " +
                                              formatProgress(until.date,
                                                  _dashboard.profile.birthDate),
                                          style: TextStyle(fontSize: 12.0))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
                    ..add(Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                    ))
                    ..add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("👏 말 들을 때까지 터치터치!",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                    ..addAll(_dashboard.counters.map((counter) {
                      return Card(
                        elevation: 3.0,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: Colors.black45,
                                    child: Icon(_resolveIcon(counter.icon)),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(counter.label,
                                            style: TextStyle(fontSize: 15.0)),
                                        Text("✌️${counter.count}✌️",
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          ButtonTheme(
                                            minWidth: 72,
                                            child: FlatButton(
                                              child: Text("+1"),
                                              onPressed: () {
                                                setState(() {
                                                  counter.count += 1;
                                                });
                                              },
                                            ),
                                          ),
                                          ButtonTheme(
                                            minWidth: 72,
                                            child: FlatButton(
                                              child: Text("+10"),
                                              onPressed: () {
                                                setState(() {
                                                  counter.count += 10;
                                                });
                                              },
                                            ),
                                          ),
                                          ButtonTheme(
                                            minWidth: 72,
                                            child: FlatButton(
                                              child: Text("+100"),
                                              onPressed: () {
                                                setState(() {
                                                  counter.count += 100;
                                                });
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );
                    }))),
            ),
          )));
  }
}
