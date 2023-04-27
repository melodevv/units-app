// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../routes/routes.dart';
import '../../viewmodel/units_viewmodel.dart';
import '../widgets/unit_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int unitToDisplay = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: const Text(
          'Select One Unit',
          style: TextStyle(fontSize: 12),
        ),
        onPressed: () {
          var unitEntered =
              Navigator.of(context).pushNamed(RouteModel.secondPage);

          setState(() {
            unitToDisplay = unitEntered as int;
            unitToDisplay--;
          });
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        foregroundColor: Colors.grey.shade900,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UnitsViewModel>().initialValue();
                context.read<UnitsViewModel>().fetchUnitsData();
              },
              icon: const Icon(
                Icons.refresh,
              ))
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Unit Reflection',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'My TPG316C Units',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Selector<UnitsViewModel, List>(
              selector: (context, viewModel) => viewModel.units,
              builder: (context, reviews, child) {
                return reviews.length == 0
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 30,
                              ),
                              child: UnitListItem(
                                unitsModel: reviews[index],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
