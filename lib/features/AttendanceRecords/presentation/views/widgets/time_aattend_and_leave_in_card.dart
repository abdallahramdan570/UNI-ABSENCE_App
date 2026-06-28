
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/AttendanceRecords/data/student_attendance_model.dart';

class TimeAattendAndLeaveInCard extends StatelessWidget {
  const TimeAattendAndLeaveInCard ({super.key, required this.student});

  final StudentAttendanceModel student;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: Colors.green, size: 18.sp),

        SizedBox(width: 4.w),

        Text(
          "Attend: ${student.attendTime}",
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),

        SizedBox(width: 12.w),

        Icon(Icons.access_time, color: Colors.red, size: 18.sp),

        SizedBox(width: 4.w),

        Expanded(
          child: Text(
            "Leave: ${student.leaveTime ?? 'Not Leave Yet'}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
