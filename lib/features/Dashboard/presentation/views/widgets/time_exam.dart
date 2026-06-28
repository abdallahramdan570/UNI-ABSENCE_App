import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';

class TimeExam extends StatelessWidget {
  const TimeExam({
    super.key,
    required this.dataExam,
    required this.isCompleted,
  });
  final String dataExam;
  final bool
  isCompleted; // افتراضياً، يمكنك تعديل هذا بناءً على الحالة الفعلية للامتحان
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, color: Colors.grey[700], size: 25.sp),
        SizedBox(width: 5.w),
        Text(
          dataExam,
          maxLines: 2,
          style: AppStyles.mediumRegular15.copyWith(color: Colors.grey[700]),
        ),
        Spacer(),

        // شارة الحالة (Status Badge)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            // لو مكتمل أخضر فاتح، لو قادم أزرق فاتح جداً
            color: isCompleted
                ? const Color(0xffE8F9EE)
                : const Color(0xffE8F0FA),
            borderRadius: BorderRadius.circular(
              20.r,
            ), // حواف دائرية مثل السكرين
            border: Border.all(
              color: isCompleted
                  ? const Color(0xffA3E2B9)
                  : const Color(0xffB3CDE8),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isCompleted ? Icons.check_circle_outline : Icons.lock_outline,
                color: isCompleted
                    ? const Color(0xff1E7E34)
                    : const Color(0xff004494),
                size: 16.sp,
              ),
              SizedBox(width: 4.w),
              Text(
                isCompleted ? 'Completed' : 'Upcoming',
                style: TextStyle(
                  color: isCompleted
                      ? const Color(0xff1E7E34)
                      : const Color(0xff004494),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
