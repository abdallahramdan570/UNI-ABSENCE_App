
import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

class NameSubjects extends StatelessWidget {
  const NameSubjects({
    super.key,
    required this.subjectName,
    required this.sectorNumber,
  });
  final String subjectName;
  final int sectorNumber;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              subjectName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleTextBold20.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "|",
              style: AppStyles.styleTextBold20.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),

            const SizedBox(width: 8),

            Text(
              "Sector $sectorNumber",

              style: AppStyles.styleTextBold20.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
