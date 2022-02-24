import 'package:flutter/material.dart';

AppBar customAppBar({required String name}) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        const Hero(
          tag: 'logo',
          child: Image(
            width: 55,
            image: AssetImage(
              'assets/images/pokemon_logo.png',
            ),
          ),
        ),
      ],
    ),
  );
}
