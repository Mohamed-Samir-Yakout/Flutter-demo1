import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spending;
  final double totalSpendingsPc;

  ChartBar({this.label, this.spending, this.totalSpendingsPc});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrainsts) {
      return Column(
        children: [
          Container(
            height: constrainsts.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spending.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constrainsts.maxHeight * 0.05,
          ),
          Container(
            height: constrainsts.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: totalSpendingsPc,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constrainsts.maxHeight * 0.05,
          ),
          Container(
            height: constrainsts.maxHeight * 0.15,
            child: FittedBox(child: Text('$label')),
          )
        ],
      );
    });
  }
}
