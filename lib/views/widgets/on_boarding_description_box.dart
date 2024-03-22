import 'package:flutter/material.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox(
      {super.key, required this.title, required this.description});

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        small20VerticalSpace(),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        ),
      ],
    );
  }
}
