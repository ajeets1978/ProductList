import 'package:flutter/material.dart';
import 'package:product_demo/widgets/top_menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120))
      ),
      child: const TopMenu(),
    );
  }
}
