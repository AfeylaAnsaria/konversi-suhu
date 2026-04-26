import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  final TextEditingController inputController = TextEditingController();
  double _hasil = 0;
  String _satuanHasil = '';

  double get hasil => _hasil;
  String get satuanHasil => _satuanHasil;

  void konversiKeFahrenheit() {
    final celsius = double.tryParse(inputController.text);
    if (celsius == null) return;
    _hasil = celsius * 9 / 5 + 32;
    _satuanHasil = 'Fahrenheit';
    notifyListeners();
  }

  void konversiKeKelvin() {
    final celsius = double.tryParse(inputController.text);
    if (celsius == null) return;
    _hasil = celsius + 273.15;
    _satuanHasil = 'Kelvin';
    notifyListeners();
  }

  void konversiKeReamur() {
    final celsius = double.tryParse(inputController.text);
    if (celsius == null) return;
    _hasil = celsius * 4 / 5;
    _satuanHasil = 'Reamur';
    notifyListeners();
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}
