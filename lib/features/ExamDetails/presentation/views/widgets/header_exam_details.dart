
import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

class HeaderExamDetails extends StatelessWidget {
  const HeaderExamDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            ' Computer Science- HCI Exam Details',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.styleTextBold20.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
        ),
        SizedBox(width: 20),
    
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.accentGreen.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(width: 4),
              Text(
                'Completed',
                style: AppStyles.mediumRegular15.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
