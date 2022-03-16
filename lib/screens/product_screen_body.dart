import 'package:flutter/material.dart';
import 'package:product_demo/constants.dart';
import 'package:product_demo/widgets/top_menu.dart';

class ProductScreenBody extends StatelessWidget {
  const ProductScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TopMenu(),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
