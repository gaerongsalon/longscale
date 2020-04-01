import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Until with EquatableMixin {
  final String id;
  String label;
  String date;
  String icon;

  Until(
      {@required this.id,
      @required this.label,
      @required this.date,
      @required this.icon});

  @override
  List get props {
    return [this.id, this.label, this.date, this.icon];
  }
}
