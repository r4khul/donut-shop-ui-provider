import 'package:donut_app_ui/models/donut.dart';
import 'package:donut_app_ui/utils/util.dart';
import 'package:flutter/material.dart';

class DonutCard extends StatelessWidget {
  final DonutModel donutInfo;
  const DonutCard({super.key, required this.donutInfo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 170,
          margin: EdgeInsets.only(top: 100, bottom: 30, left: 10, right: 10),
          padding: EdgeInsets.all(20),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                donutInfo.name!,
                style: TextStyle(
                  color: Utils.mainDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Utils.mainColor,
                ),
                child: Text(
                  '\$${donutInfo.price!.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(donutInfo.imgUrl!, width: 170, height: 175),
        ),
      ],
    );
  }
}
