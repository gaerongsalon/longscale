import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Counter with EquatableMixin {
  final String id;
  String label;
  String date;
  int count;
  String icon;

  Counter(
      {@required this.id,
      @required this.label,
      @required this.date,
      @required this.count,
      @required this.icon});

  @override
  List get props {
    return [this.id, this.label, this.date, this.count, this.icon];
  }
}
