import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/units_model.dart';

class UnitsService with ChangeNotifier {
  static Future<List<UnitsModel>> get FetchData async {
    List<UnitsModel> units = [];
    Map<String, dynamic> map = {};
    print('passed here');
    final response = await get(
      Uri.parse(
          'https://dl.dropbox.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );
    print('here');
    if (response.statusCode == 200) {
      try {
        map = jsonDecode(response.body);
        // _error = false;

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
        throw Exception(e.toString());
      }
    } // end if
    else {
      throw Exception(
          'Error: Could be something wrong with your internet connection');
    }

    return units;
  } // end Future<void>
} // end class