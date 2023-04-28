// Student Number: 220030521
// Surname Initial: Direko T

// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import '../../routes/routes.dart';
import '../../viewmodel/units_viewmodel.dart';
import '../widgets/app_error.dart';
import '../widgets/loading_bar.dart';
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
    context.read<UnitsViewModel>().fetchUnitsData();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: const Text(
          'Select One Unit',
          style: TextStyle(fontSize: 12),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteModel.secondPage);
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Selector<UnitsViewModel, List>(
              selector: (context, viewModel) => viewModel.units,
              builder: (context, unit, child) {
                return unit.isNotEmpty || UnitsViewModel.selectedUnit == -1
                    ? ListView.builder(
                        itemCount: unit.length,
                        itemBuilder: (context, index) {
                          return UnitListItem(
                            unitsModel: unit[index],
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'UNIT NOT FOUND',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      );
              },
            ),
          ),
          Selector<UnitsViewModel, Tuple2>(
            selector: (context, viewModel) =>
                Tuple2(viewModel.loading, viewModel.loadingMessage),
            builder: (context, tuple, child) {
              return tuple.item1
                  ? LoadingBar(
                      loadingText: tuple.item2,
                    )
                  : Container();
            },
          ),
          Selector<UnitsViewModel, Tuple2>(
            selector: (context, viewModel) =>
                Tuple2(viewModel.error, viewModel.errorMessage),
            builder: (context, tuple, child) {
              return tuple.item1
                  ? AppError(
                      message: tuple.item2,
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
