import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uni_absence/core/utils/color.dart';

class ExamReportInfoCard extends StatelessWidget {
  const ExamReportInfoCard({
    super.key,
    required this.courseName,
    required this.examDate,
    required this.examTime,
    required this.status,
  });
  

  final String courseName;
  final DateTime examDate;
  final String examTime;
  final String status;
  @override
  Widget build(BuildContext context) {
    // تحديد شكل الـ Badge حسب حالة الامتحان
    late Color backgroundColor;
    late Color borderColor;
    late Color textColor;
    late IconData icon;

    switch (status) {
      case "Completed":
        backgroundColor = const Color(0xffE8F9EE);
        borderColor = const Color(0xffA3E2B9);
        textColor = const Color(0xff1E7E34);
        icon = Icons.check_circle;
        break;

      case "Current":
        backgroundColor = const Color(0xffFFF4E5);
        borderColor = const Color(0xffF4B860);
        textColor = const Color(0xffE67E22);
        icon = Icons.play_circle_fill;
        break;

      default:
        backgroundColor = const Color(0xffE8F0FA);
        borderColor = const Color(0xffB3CDE8);
        textColor = const Color(0xff004494);
        icon = Icons.schedule;
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  courseName,

                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBlue,
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                "Full Exam Details",
                style: TextStyle(color: Colors.grey[900], fontSize: 15.sp),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: textColor, size: 14),
                    SizedBox(width: 6.w),
                    Text(
                      status,
                      style: TextStyle(
                        color: Color(0xff1E7E34),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const Divider(),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: const Color(0xff004494),
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            DateFormat('MMM dd, yyyy').format(examDate),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: const Color(0xff004494),
                      size: 22.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            examTime,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
