import 'package:flutter/material.dart';

import '../models/units_model.dart';
import '../services/units_service.dart';

class UnitsViewModel with ChangeNotifier {
  UnitsViewModel() {
    fetchUnitsData();
  }

  List<UnitsModel> _units = [];
  List<UnitsModel> get units => _units;

  UnitsModel? _selectedUnit;
  UnitsModel? get selectedUnit => _selectedUnit;
  set selectedUnit(UnitsModel? unit) {
    _selectedUnit = unit;
    notifyListeners();
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

  void initialValue() {
    _units = [];
  }
}
