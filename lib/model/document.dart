import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import './counter.dart';
import './profile.dart';
import './until.dart';

class Document with EquatableMixin {
  final String id;
  Profile profile;
  List<Counter> counters;
  List<Until> untils;

  Document(
      {@required this.id, this.counters = const [], this.untils = const []});

  @override
  List get props {
    return [this.id, this.profile, this.counters, this.untils];
  }
}
