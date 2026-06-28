
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/attendance_records_View_body.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/attendance_records_total_items.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/data_list.dart';

class AttendanceStatsSection extends StatelessWidget {
  const AttendanceStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AttendanceRecordsTotalItems(
            icons: Icons.school_outlined,
            iconcolor: AppColors.primaryBlue,
            title: "Total",
            count: studentsList.length,
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: AttendanceRecordsTotalItems(
            icons: Icons.check_circle,
            iconcolor: AppColors.accentGreen,
            title: "Present",
            count: studentsList.where((s) => s.attended).length,
          ),
        ),
        SizedBox(width: 1.w), 
        Expanded(
          child: AttendanceRecordsTotalItems(
            icons: Icons.cancel,
            iconcolor: AppColors.accentRed,
            title: "Absent",
            count: studentsList.where((s) => !s.attended).length,
          ),
        ),
      ],
    );
  }
}