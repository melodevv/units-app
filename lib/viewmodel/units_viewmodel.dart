import 'package:flutter/material.dart';

import '../models/units_model.dart';
import '../services/units_service.dart';

class UnitsViewModel extends ChangeNotifier {
  List<UnitsModel> _allUnits = [];
  static int selectedUnit = -1;

  UnitsViewModel() {
    fetchUnitsData();
    selectedToDisplay();
  }

  List<UnitsModel> _units = [];
  List<UnitsModel> get units {
    _units.clear();
    if (selectedUnit == -1) {
      _units = _allUnits;
    } else {
      selectedToDisplay();
    }
    return _units;
  }

  void selectedToDisplay() {
    startLoading('loading unit');
    try {
      stopLoading();
      // print('trying $_allUnits');
      if (selectedUnit >= 0 && selectedUnit < _allUnits.length) {
        _units = [];
        _units.add(_allUnits[selectedUnit]);
      } else {
        _units = [];
      }
    } catch (e) {
      startError(e.toString());
    }
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
      _allUnits = await UnitsService.FetchData;
      stopLoading();
    } catch (e) {
      stopLoading();
      startError(e.toString());
    }
  }

  // void displaySelectedUnit(int index) {
  //   if (index == 0) {
  //     selectedUnit.addAll(_units);
  //   } else if (index > 0 && index <= _units.length) {
  //     selectedUnit.add(_units[index]);
  //   } else {
  //     startError('The unit number entered does not exist');
  //   }
  //   notifyListeners();
  // }

  void initialValue() {
    _units = [];
    selectedUnit = -1;
    stopError();
  }
}
