// Student Number: 220030521
// Surname Initial: Direko T

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitsapp/routes/routes.dart';
import 'package:unitsapp/viewmodel/units_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UnitsViewModel(),
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RouteModel.homePage,
              onGenerateRoute: RouteModel.generateRoute,
            );
          },
        ),
      ],
    );
  }
}
