
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/AttendanceRecords/data/student_attendance_model.dart';

class IDandDepartment extends StatelessWidget {
  const IDandDepartment({
    super.key,
    required this.student,
  });

  final StudentAttendanceModel student;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${student.id}  ${student.level}  ${student.department}",
      style: TextStyle(
        color: Colors.black87,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
