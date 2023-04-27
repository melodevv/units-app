import 'package:flutter/material.dart';
import '../../models/units_model.dart';

class UnitListItem extends StatelessWidget {
  const UnitListItem({
    super.key,
    required this.unitsModel,
  });

  final UnitsModel unitsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Image.network(unitsModel.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unitsModel.unitNr,
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  unitsModel.concepts,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.blueGrey.shade900,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  unitsModel.definition,
                  style: TextStyle(
                    color: Colors.blueGrey.shade900,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
