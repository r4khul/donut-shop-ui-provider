import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class DonutShoppingListRow extends StatelessWidget {
  final DonutModel donut;
  final Function onDeleteRow;
  const DonutShoppingListRow({
    super.key,
    required this.donut,
    required this.onDeleteRow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20),
      child: Row(
        children: [
          Image.network(donut.imgUrl!, width: 80, height: 80),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donut.name!,
                  style: TextStyle(
                    color: Utils.mainDark,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Utils.mainDark.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    "\$${donut.price!.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Utils.mainDark.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              onDeleteRow();
            },
            icon: Icon(Icons.delete_forever, color: Utils.mainColor),
          ),
        ],
      ),
    );
  }
}
