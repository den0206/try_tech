import 'package:flutter/widgets.dart';

class ShoesModel with ChangeNotifier {
  String _imagePath = "assets/images/amarillo.png";
  double _size = 9;

  String get imagePath => _imagePath;
  double get size => _size;

  set imagePath(String value) {
    this._imagePath = value;
    notifyListeners();
  }

  set size(double value) {
    this._size = value;
    notifyListeners();
  }
}
