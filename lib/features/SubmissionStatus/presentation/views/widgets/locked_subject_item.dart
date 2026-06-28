
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LockedSubjectItem extends StatelessWidget {
  final String subjectName;
  final String absentStudents;
  final String lockTime;

  const LockedSubjectItem({
    super.key,
    required this.subjectName,
    required this.absentStudents,
    required this.lockTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC), // خلفية رمادية هادئة للفصل
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  subjectName,
                  style: TextStyle(
                    color: const Color(0xff004494),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xffE2EFE0),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  'LOCKED',
                  style: TextStyle(
                    color: const Color(0xff2E5A27),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // الغائبين
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.person_remove_alt_1_outlined,
                color: Colors.red.shade700,
                size: 20.sp,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Absent: ',
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                        text: absentStudents,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Divider(height: 1, thickness: 1.5),
          SizedBox(height: 8.h),

          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey[900], size: 16.sp),
              SizedBox(width: 9.w),
              Text(
                'Locked: $lockTime',
                style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
