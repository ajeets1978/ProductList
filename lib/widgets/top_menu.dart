import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopMenu extends StatefulWidget {
  const TopMenu({
    Key? key,
  }) : super(key: key);
  @override
  State<TopMenu> createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  int selectedIndex = 0;
  final List categories = ['All', 'Sneakers', 'Joggers', 'Runners', 'Formal', 'Casual'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
          ),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              //color: Colors.white.withOpacity(.4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
      ),
    );
  }
}
