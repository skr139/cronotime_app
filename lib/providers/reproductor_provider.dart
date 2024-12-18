import 'package:flutter/material.dart';

class ReproductorProvider extends ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void play() {
    _isPlaying = true;
    notifyListeners();
  }

  void stop() {
    _isPlaying = false;
    notifyListeners();
  }
}
