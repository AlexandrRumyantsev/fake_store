import 'package:flutter/material.dart';

import '../../di/init.dart';

enum SplashState { loading, success }

class SplashViewModel extends ChangeNotifier {
  SplashState _state = SplashState.loading;

  SplashState get state => _state;

  Future<void> initialize() async {
    configureDependencies();

    await Future.delayed(const Duration(milliseconds: 3000));

    _state = SplashState.success;
    notifyListeners();
  }
}
