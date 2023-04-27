import 'package:flutter/material.dart';
import '../views/pages/homepage.dart';
import '../views/pages/secondpage.dart';

class RouteModel {
  static const homePage = '/';
  static const secondPage = '/secondPage';
  static const unitFour = '/unitTwo';
  static const unitThee = '/unitThree';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case secondPage:
        return MaterialPageRoute(
          builder: (context) => SecondPage(),
        );
      default:
        throw const FormatException('Route not found, check routes again');
    } // end of switch
  } // end generateRoute method
} // end class
