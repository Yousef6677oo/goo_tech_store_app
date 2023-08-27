import 'package:flutter/material.dart';

class CustomOrderInfo extends StatelessWidget {
  String subTotal;
  String shippingCost;
  String total;

  CustomOrderInfo(
      {required this.subTotal,
      required this.shippingCost,
      required this.total});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Text(
            "Order Info",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).hintColor),
          ),
        ),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: const Text(
                "Subtotal",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                subTotal,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter-VariableFont',
                    color: Theme.of(context).secondaryHeaderColor),
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.012),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: const Text(
                "Shipping cost",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                shippingCost,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter-VariableFont',
                    color: Theme.of(context).secondaryHeaderColor),
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.012),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: const Text(
                "Total",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter-VariableFont',
                    color: Color(0xff8F959E)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Text(
                total,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter-VariableFont',
                    color: Theme.of(context).secondaryHeaderColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
