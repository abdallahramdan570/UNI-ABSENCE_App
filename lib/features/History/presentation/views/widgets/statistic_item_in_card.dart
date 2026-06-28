
import 'dart:ui';

import 'package:flutter/material.dart';

class StatisticItemInCard extends StatelessWidget {
  const StatisticItemInCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,)),

        SizedBox(height: 5),

        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
