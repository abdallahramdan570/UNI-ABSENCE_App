
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/features/AttendanceRecords/data/student_attendance_model.dart';

class TrueIconInCard extends StatelessWidget {
  const TrueIconInCard({super.key, required this.student});

  final StudentAttendanceModel student;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      backgroundColor: student.attended
          ? AppColors.activeBlue
          : AppColors.inactiveGreyBg,
      child: Icon(
        Icons.check,
        color: student.attended ? Colors.white : Colors.grey.shade600,
        size: 18.sp,
      ),
    );
  }
}
