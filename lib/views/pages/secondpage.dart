import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/units_viewmodel.dart';

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
                  Navigator.pop(context, unitNumController.text);
                  var units = context.watch<UnitsViewModel>().units;
                  context.read<UnitsViewModel>().selectedUnit =
                      units[(unitNumController.text as int) - 1];
                },
                child: const Text('Open Unit'))
          ],
        ),
      ),
    );
  }
}
