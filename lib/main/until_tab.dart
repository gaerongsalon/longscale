import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:longscale/shared/dialog.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/document.dart';
import '../model/until.dart';
import './event.dart';
import './sub_profile_card.dart';
import './tab_view.dart';
import './until_card.dart';
import './sub_panel.dart';

class UntilTabBuilder extends TabViewBuilder {
  final BottomNavigationBarItem navigationItem = const BottomNavigationBarItem(
    title: Text("자람"),
    icon: const Icon(Icons.calendar_today),
  );

  Widget build(BuildContext context, EventBus bus, Document document) {
    return _UntilTabView(document: document, bus: bus);
  }
}

class _UntilTabView extends StatefulWidget {
  _UntilTabView({
    Key key,
    @required this.document,
    @required this.bus,
  }) : super(key: key);

  final Document document;
  final EventBus bus;

  @override
  _UntilTabViewState createState() =>
      _UntilTabViewState(document: document, bus: bus);
}

class _UntilTabViewState extends State<_UntilTabView> {
  _UntilTabViewState({@required this.document, @required this.bus});

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
            SubProfileCard(profile: document.profile, title: '쑥쑥 크고 있어요! 🌱🌱'),
            _buildCalendar(context),
            Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 24.0),
                child: _buildUntilBody()),
          ],
        ),
      ),
    );
  }

  TableCalendar _buildCalendar(BuildContext context) {
    return TableCalendar(
      calendarController: CalendarController(),
      events: {
        DateTime.now(): ["ABC"]
      },
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      onDayLongPressed: (dateTime, events) async {
        final title = await asyncInputDialog(
            context: context, title: "일정을 추가합니다", label: "이벤트 이름");
        if (title == null) {
          return;
        }
        bus.fire(NewUntil(
            until: Until(
                id: 'abcd',
                date: DateFormat('yyyy-MM-dd').format(dateTime),
                icon: 'archive',
                label: title)));
      },
      builders:
          CalendarBuilders(markersBuilder: (context, date, events, holydays) {
        print(events.length.toString());
        if (events.isEmpty) {
          return [];
        }
        return [
          Positioned(
              right: 1,
              bottom: 1,
              child: Center(
                child: Text(
                  '${events[0]}',
                ),
              ))
        ];
      }),
    );
  }

  Widget _buildUntilBody() {
    return SubPanel(
        title: '💪 이제 금방이에요!',
        values: document.untils,
        builder: (value) => UntilCard(
              until: value,
              birthDate: document.profile.birthDate,
            ));
  }
}
