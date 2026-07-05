import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';

class TimeExam extends StatelessWidget {
  const TimeExam({
    super.key,
    required this.dataExam,
    required this.status,
  });

  // الوقت
  final String dataExam;

  // الحالة القادمة من الـ Entity
  final String status;

  @override
  Widget build(BuildContext context) {
   
  // هنحدد الألوان والأيقونة حسب حالة الامتحان
  late Color backgroundColor;
  late Color borderColor;
  late Color textColor;
  late IconData icon;

  switch (status) {
    case "Completed":
      backgroundColor = const Color(0xffE8F9EE);
      borderColor = const Color(0xffA3E2B9);
      textColor = const Color(0xff1E7E34);
      icon = Icons.check_circle_outline;
      break;

    case "Current":
      backgroundColor = const Color(0xffFFF4E5);
      borderColor = const Color(0xffF4B860);
      textColor = const Color(0xffE67E22);
      icon = Icons.play_circle_outline;
      break;

    default:
      backgroundColor = const Color(0xffE8F0FA);
      borderColor = const Color(0xffB3CDE8);
      textColor = const Color(0xff004494);
      icon = Icons.schedule;
  }
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 24.sp,
          color: Colors.grey,
        ),

        SizedBox(width: 6.w),

        Expanded(
          child: Text(
            dataExam,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.mediumRegular15.copyWith(
              color: Colors.grey[700],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 6.h,
          ),

          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: borderColor,
            ),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: textColor,
              ),

              SizedBox(width: 5.w),

              Text(
                status,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}