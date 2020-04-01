import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Profile with EquatableMixin {
  final String id;
  String name;
  String pictureUrl;
  String birthDate;

  Profile({@required this.id, this.name, this.pictureUrl, this.birthDate});

  @override
  List get props {
    return [this.id, this.name, this.pictureUrl, this.birthDate];
  }
}
