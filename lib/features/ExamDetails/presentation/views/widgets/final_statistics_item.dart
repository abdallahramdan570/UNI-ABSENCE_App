import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// removed unused import

class FinalStatisticsItem extends StatelessWidget {
  const FinalStatisticsItem({
    super.key,
    required this.text,
    required this.number,
    required this.color,
  });

  final String text;
  final int number;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(1, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: color,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  number.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
