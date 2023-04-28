import 'package:flutter/material.dart';

import '../models/units_model.dart';
import '../services/units_service.dart';

class UnitsViewModel with ChangeNotifier {
  UnitsViewModel() {
    fetchUnitsData();
  }

  List<UnitsModel> _units = [];
  List<UnitsModel> get units => _units;
  set units(List<UnitsModel> value) {
    _units = value;
  }

  List<UnitsModel> _selectedUnit = [];
  List<UnitsModel> get selectedUnit => _selectedUnit;
  set selectedUnits(List<UnitsModel> value) {
    _selectedUnit = value;
  }

  bool _error = false;
  bool get error => _error;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void startError(String message) {
    _error = true;
    _errorMessage = message;
    notifyListeners();
  }

  void stopError() {
    _error = false;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;

  String _loadingMessage = '';
  String get loadingMessage => _loadingMessage;

  void startLoading(String message) {
    _loading = true;
    _loadingMessage = message;
    notifyListeners();
  }

  void stopLoading() {
    _loading = false;
    notifyListeners();
  }

  void fetchUnitsData() async {
    startLoading('Loading... please wait...');

    try {
      _units = await UnitsService.FetchData;
      stopLoading();
    } catch (e) {
      stopLoading();
      startError(e.toString());
    }
  }

  void displaySelectedUnit(int index) {
    if (index == 0) {
      selectedUnit.addAll(_units);
    } else if (index > 0 && index <= _units.length) {
      selectedUnit.add(_units[index]);
    } else {
      startError('The unit number entered does not exist');
    }
    notifyListeners();
  }

  void initialValue() {
    _units = [];
    _selectedUnit = [];
    startLoading('Loading');
    stopError();
  }
}
