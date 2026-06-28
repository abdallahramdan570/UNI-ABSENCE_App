
import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

class StudentTotal extends StatelessWidget {
  const StudentTotal({
    super.key,
    required this.sectorNumber,
    required this.totalStudents,
    required this.subjectName,
  });

  final int sectorNumber;
  final int totalStudents;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sector $sectorNumber (Total: $totalStudents Students)",
            style: AppStyles.styleTextBold20.copyWith(
              color: AppColors.primaryBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 3),

          Text(
            "Mark attendance for $subjectName examination.",
            style: AppStyles.mediumRegular15.copyWith(
              color: AppColors.textSubtitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
