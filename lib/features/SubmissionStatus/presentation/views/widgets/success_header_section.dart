
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessHeaderSection extends StatelessWidget {
  const SuccessHeaderSection({super.key, required this.section});
  final String section;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الدوائر المتداخلة كما في التصميم
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100.h,
              height: 100.h,
              decoration: BoxDecoration(
                color: const Color(0xffE8F9EE),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffA3E2B9).withValues(alpha: 0.5), width: 8),
              ),
            ),
            Container(
              width: 70.h,
              height: 70.h,
              decoration: const BoxDecoration(
                color: Color(0xff1E7E34),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'Submission\nSuccessful!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xff004494),
            fontSize: 28.sp,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Attendance records for $section have been securely synchronized and locked.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[900], fontSize: 15.sp, height: 1.7),
          ),
        ),
      ],
    );
  }
}
