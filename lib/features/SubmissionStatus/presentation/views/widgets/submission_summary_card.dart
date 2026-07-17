import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/course_attendance_model.dart';
// removed unused import
import 'package:uni_absence/features/History/presentation/views/widgets/history_body_views.dart' hide CourseAttendanceModel;
import 'package:uni_absence/features/SubmissionStatus/presentation/views/widgets/locked_subject_item.dart';

class SubmissionSummaryCard extends StatelessWidget {
  const SubmissionSummaryCard({super.key,  this.course});

  final CourseAttendanceModel? course;

  @override
  Widget build(BuildContext context) {
  

    final absentStudents = 4;

    final presentStudents =6 ;
      final totalStudents =  absentStudents + presentStudents;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // هيدر الكارد
          Row(
            children: [
              const Icon(
                Icons.assignment_outlined,
                color: Color(0xff004494),
                size: 20,
              ),
              SizedBox(width: 8.w),
              Text(
                'SUBMISSION SUMMARY',
                style: TextStyle(
                  color: const Color(0xff004494),
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  letterSpacing: .5,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(thickness: 1.5),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Students',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                totalStudents.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Present Students',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                presentStudents.toString(),
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Absent Students',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                absentStudents.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          LockedSubjectItem(
            subjectName:  'Abdallah Ramadan',
            absentStudents:  absentStudents == 0
                ? "No absent students"
                : absentStudents.toString(),
            lockTime: course?.lockTime ?? '',
          ),
        ],
      ),
    );
  }
}
