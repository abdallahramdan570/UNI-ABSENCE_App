
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/AttendanceRecords/data/student_attendance_model.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/false_icon_In_card.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/true_icon_In_card.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/id_and_department.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/time_aattend_and_leave_in_card.dart';

class StudentAttendanceCard extends StatelessWidget {
  const StudentAttendanceCard({super.key, required this.student});

  final StudentAttendanceModel student;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade400),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IDandDepartment(student: student),

          SizedBox(height: 10.h),

          Row(
            children: [
              Expanded(
                child: Text(
                  student.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(width: 8.w),

              FalseIconInCard(student: student),

              SizedBox(width: 6.w),

              TrueIconInCard(student: student),
            ],
          ),

          SizedBox(height: 12.h),

          TimeAattendAndLeaveInCard(student: student),
        ],
      ),
    );
  }
}