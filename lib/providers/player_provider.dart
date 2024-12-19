import 'package:flutter/material.dart';

class PlayerProvider extends ChangeNotifier {
  bool _isPlaying = false;
  double _rate = 1.0;

  bool get isPlaying => _isPlaying;
  double get rate => _rate;

  void play() {
    _isPlaying = true;
    notifyListeners();
  }

  void stop() {
    _isPlaying = false;
    notifyListeners();
  }

  void setRate(double rate) {
    _rate = rate;
    notifyListeners();
  }
}
