import 'package:meta/meta.dart';

import '../model/until.dart';

class NewUntil {
  NewUntil({@required this.until});

  final Until until;
}

class IncrementCounter {
  IncrementCounter({@required this.counterId, @required this.delta});

  final String counterId;
  final int delta;
}
