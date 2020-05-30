// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('yy. M. d.').format(date);
}

String formatDateFromString(String dateString) {
  return formatDate(DateTime.parse(dateString));
}

String formatAge(String birthDate) {
  var birthday = DateTime.parse(birthDate);
  var aliveDays = DateTime.now().difference(birthday).inDays + 1;
  if (aliveDays < 30) {
    return '👶 ${aliveDays}일';
  } else if (aliveDays < 365) {
    var month = aliveDays ~/ 30;
    var days = (aliveDays - (month * 30));
    return '👶 ${month}개월 ${days}일 (${aliveDays}일)';
  } else {
    var year = aliveDays ~/ 365;
    var month = ((aliveDays - (year * 365)) ~/ 30) + 1;
    return '👶 ${(year + 1)}살 ${month}개월 (${aliveDays}일)';
  }
}

String formatDDays(String targetDateString) {
  var targetDate = DateTime.parse(targetDateString);
  var days = DateTime.now().difference(targetDate).inDays;
  if (days < 0) {
    return '${-1 * days}일 남았어요';
  } else if (days > 0) {
    return '${days}일 지났어요';
  } else {
    return '🎉 오늘입니다 🎉';
  }
}

String formatProgress(String targetDateString, String birthDate) {
  var targetDate = DateTime.parse(targetDateString);
  var remainDays = targetDate.difference(DateTime.now()).inDays;
  if (remainDays <= 0) {
    return '✔️';
  } else {
    var birthday = DateTime.parse(birthDate);
    var pastDays = DateTime.now().difference(birthday).inDays + 1;
    var allDays = targetDate.difference(birthday).inDays;
    return '🏃' + ((pastDays * 100.0) / allDays).toStringAsFixed(1) + '%';
  }
}
