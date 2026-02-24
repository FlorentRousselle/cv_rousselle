import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final homeProvider = ChangeNotifierProvider((ref) {
  return HomeNotifier();
});

class HomeNotifier with ChangeNotifier {}
