import 'package:flutter/material.dart';
import 'dart:collection';

class WeatherIcons {
  static HashMap<String, IconData> _iconsMap = HashMap<String, IconData>() ;
  static IconData getIcon(String key) {
    if (_iconsMap.isEmpty) {
      fill();
    }
    if (!_iconsMap.containsKey(key)) return Icons.block;
    return _iconsMap[key];
  }

  static fill() {
    _iconsMap['partly-cloudy-day'] = Icons.wb_cloudy;
    _iconsMap['partly-cloudy-night'] = Icons.wb_cloudy;
    _iconsMap['snow'] = Icons.ac_unit;
    _iconsMap['fog'] = Icons.format_align_center;
    _iconsMap['cloudy'] = Icons.wb_cloudy;
    _iconsMap['sunny'] = Icons.wb_sunny;
  }
}
