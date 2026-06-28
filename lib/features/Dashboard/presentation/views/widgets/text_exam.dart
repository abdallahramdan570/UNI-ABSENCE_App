

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/styles.dart';

class TextExam extends StatelessWidget {
  const TextExam({
    super.key,
    required this.selectedSector,
  });

  final int selectedSector;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Exams in SECTOR ${selectedSector + 1}",
          style: AppStyles.styleTextBold20.copyWith(color: Colors.blue),
        ),
        Text(
          "All Academic Levels",
          style: AppStyles.mediumRegular15.copyWith(
            color: Color(0xFF424752),
          ),
        ),
      ],
    );
  }
}
