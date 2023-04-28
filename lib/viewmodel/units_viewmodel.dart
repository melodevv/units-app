// Student Number: 220030521
// Surname Initial: Direko T

import 'package:flutter/material.dart';
import '../models/units_model.dart';
import '../services/units_service.dart';

class UnitsViewModel extends ChangeNotifier {
  List<UnitsModel> _allUnits = [];

  // variable to get the user requested unit
  static int selectedUnit = -1;

  //
  // Class Constructor
  //
  UnitsViewModel() {
    fetchUnitsData();
    selectedToDisplay();
  }

  //
  // unit List variable with
  // setter and getter method
  //
  List<UnitsModel> _units = [];
  List<UnitsModel> get units {
    //
    // units filtering according to user request
    //
    _units.clear();
    if (selectedUnit == -1) {
      _units = _allUnits;
    } else {
      selectedToDisplay();
    }
    return _units;
  }

  //
  // Method to vaildate user input
  //
  void selectedToDisplay() {
    try {
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

  //
  // Variables to work with Errors and
  // Custom Loading Messages
  //
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
  }

  void stopLoading() {
    _loading = false;
    notifyListeners();
  }

  //
  // Method to fetch data from the
  // cloud storage
  //
  void fetchUnitsData() async {
    startLoading('Loading...');

    try {
      _allUnits = await UnitsService.fetchData;
      stopLoading();
    } catch (e) {
      stopLoading();
      startError(e.toString());
    }
  }

  //
  // Reset variables to initial state
  //
  void initialValue() {
    _units = [];
    selectedUnit = -1;
    stopError();
  }
}
