import 'dart:async';
import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;
  Timer? _timer;
  final int totalPages = 3;
  final Duration pageDuration = const Duration(milliseconds: 3000);
  VoidCallback? onComplete;

  int get currentPage => _currentPage;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer(pageDuration, () {
      if (_currentPage < totalPages - 1) {
        nextPage();
      } else {
        onComplete?.call();
      }
    });
  }

  void nextPage() {
    if (_currentPage < totalPages - 1) {
      _currentPage++;
      notifyListeners();
      startTimer();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
      startTimer();
    }
  }

  bool get isLastPage => _currentPage == totalPages - 1;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
