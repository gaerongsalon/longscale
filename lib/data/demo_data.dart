import '../model/counter.dart';
import '../model/document.dart';
import '../model/profile.dart';
import '../model/until.dart';

Document buildDemoDocument() {
  var dashboard = new Document(id: 'test-dashboard');
  dashboard.profile = Profile(id: 'abc');
  dashboard.profile.name = '롱롱이';
  dashboard.profile.pictureUrl = '';
  dashboard.profile.birthDate = '2020-04-01';

  dashboard.counters = [
    Counter(
        id: 'a1',
        label: '잘자라 우리롱롱~',
        icon: 'airline_seat_flat',
        date: '2020-03-31',
        count: 123),
    Counter(
        id: 'a2',
        label: '맛나게 먹자~',
        icon: 'local_drink',
        date: '2020-03-31',
        count: 123),
    Counter(
        id: 'a3',
        label: '어화둥둥',
        icon: 'child_care',
        date: '2020-03-31',
        count: 123),
    Counter(
        id: 'a4',
        label: '잘먹고 트름하기!',
        icon: 'airline_seat_recline_extra',
        date: '2020-03-31',
        count: 123),
  ];
  dashboard.untils = [
    Until(id: 'x1', label: '첫 번째 도약기', icon: 'favorite', date: '2020-05-05'),
    Until(id: 'x2', label: '두 번째 도약기', icon: 'audiotrack', date: '2020-05-25'),
    Until(
        id: 'x3', label: '세 번째 도약기', icon: 'brightness_2', date: '2020-07-05'),
  ];
  return dashboard;
}
