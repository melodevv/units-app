// Student Number: 220030521
// Surname Initial: Direko T

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unitsapp/viewmodel/units_viewmodel.dart';
import '../models/units_model.dart';

class UnitsService with ChangeNotifier {
  //
  // The  below code get data from a cloud service
  // and creates the model for the app
  //
  static Future<List<UnitsModel>> get fetchData async {
    List<UnitsModel> units = [];
    Map<String, dynamic> map = {};
    final response = await get(
      Uri.parse(
          'https://dl.dropbox.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );
    if (response.statusCode == 200) {
      try {
        map = jsonDecode(response.body);

        for (var item in map["Specs"]) {
          units.add(
            UnitsModel(
              definition: item['definition'].toString(),
              concepts: item['concepts'].toString(),
              unitNr: item['unit'].toString(),
              image: item['image'].toString(),
            ),
          );
        }
      } catch (e) {
        UnitsViewModel().startError(e.toString());
      }
    } // end if
    else {
      UnitsViewModel().startError(
          'Error: Could be something wrong with your internet connection');
    }

    return units;
  } // end Future<void>
} // end class
