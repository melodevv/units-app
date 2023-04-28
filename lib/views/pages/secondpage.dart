// Student Number: 220030521
// Surname Initial: Direko T

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitsapp/viewmodel/units_viewmodel.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final unitNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Unit One',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: unitNumController,
                decoration: InputDecoration(
                  hintText: 'Enter Unit Number',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade900),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade900),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  //
                  // Trying to make sure an empty string doesnt get passed
                  //
                  if (unitNumController.text != '') {
                    UnitsViewModel.selectedUnit =
                        int.parse(unitNumController.text) - 1;

                    Navigator.pop(context);
                    context.read<UnitsViewModel>().fetchUnitsData();
                    context.read<UnitsViewModel>().selectedToDisplay();
                  }
                },
                child: const Text('Open Unit'))
          ],
        ),
      ),
    );
  }
}
