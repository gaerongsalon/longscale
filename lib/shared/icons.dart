import 'package:flutter/material.dart';

IconData resolveIcon(String iconName) {
  switch (iconName) {
    case 'airline_seat_flat':
      return Icons.airline_seat_flat;
    case 'local_drink':
      return Icons.local_drink;
    case 'child_care':
      return Icons.child_care;
    case 'airline_seat_recline_extra':
      return Icons.airline_seat_recline_extra;
    case 'favorite':
      return Icons.favorite;
    case 'audiotrack':
      return Icons.audiotrack;
    case 'brightness_2':
      return Icons.brightness_2;
  }
  return Icons.account_circle;
}
