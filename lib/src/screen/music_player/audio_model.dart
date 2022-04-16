import 'package:flutter/material.dart';

class AudioModel with ChangeNotifier {
  bool _playing = false;
  late AnimationController _controller;
  Duration _trackDuration = Duration(milliseconds: 0);
  Duration _current = Duration(milliseconds: 0);

  String get trackTotalDuration => this.printDuration(this._trackDuration);
  String get currentTotalDuration => this.printDuration(this.current);

  double get percentage => (this._trackDuration.inSeconds > 0)
      ? this._current.inSeconds / this._trackDuration.inSeconds
      : 0;

  bool get playind => _playing;
  set playing(bool value) {
    this._playing = value;
    notifyListeners();
  }

  set controller(AnimationController value) {
    this._controller = value;
  }

  AnimationController get controller => _controller;

  Duration get trackDuration => _trackDuration;

  set trackDuration(Duration value) {
    this._trackDuration = value;
    notifyListeners();
  }

  Duration get current => _current;

  set current(Duration value) {
    this._current = value;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitminutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSecounds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitminutes:$twoDigitSecounds";
  }
}
