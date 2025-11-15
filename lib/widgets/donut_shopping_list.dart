import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/widgets/donut_shopping_list_row.dart';
import 'package:flutter/material.dart';

class DonutShoppingList extends StatefulWidget {
  final List<DonutModel> donutCart;
  final dynamic cartService;
  const DonutShoppingList({super.key, required this.donutCart, required this.cartService});

  @override
  State<DonutShoppingList> createState() => _DonutShoppingListState();
}

class _DonutShoppingListState extends State<DonutShoppingList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.donutCart.length,
      itemBuilder: (context, index) {
        DonutModel currentDonut = widget.donutCart[index];
        return DonutShoppingListRow(
          donut: currentDonut,
          onDeleteRow: () {
            widget.cartService.removeItem(currentDonut);
          },
        );
      },
    );
  }
}
