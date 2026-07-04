import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';

class DashBordButtom extends StatelessWidget {
  const DashBordButtom({super.key, required this.isCompleted, required this.examData});
  final bool isCompleted; // حالة الامتحان (مكتمل أو غير مكتمل)
  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue, // Set the background color

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),

        onPressed: () {
          if (isCompleted) {
            GoRouter.of(context).push(AppPagesName.kattendanceView, extra: examData);
          } else {
            GoRouter.of(context).push(AppPagesName.kexamDetailsView, extra: examData);

            // الأكشن الخاص بـ Prepare Attendance للامتحانات القادمة
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isCompleted
                  ? Icons.remove_red_eye_outlined
                  : Icons.assignment_turned_in_outlined,
              color: Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              isCompleted ? 'View Records' : 'Prepare Attendance',
              style: AppStyles.styleTextBold20.copyWith(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            ),
            if (isCompleted) ...[
              SizedBox(width: 6.w),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12.sp),
            ],
          ],
        ),
      ),
    );
  }
}
