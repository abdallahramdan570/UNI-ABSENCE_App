import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_absence/core/utils/app_assets.dart';

class StudentProfileCard extends StatelessWidget {
  const StudentProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            // صورة الطالب الشخصية مع شارة التحذير الحمراء الصغيرة
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    Assets.assetsImagesProfileId,
                    width: 75.h,
                    height: 75.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -4.h,
                  right: -4.w,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesIconNoAccass,

                      width: 12,
                      height: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            // البيانات النصية للطالب
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Abdallah Ramadan Othman',
                    style: TextStyle(
                      color: const Color(0xff004494),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'ID: 221236',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Computer Science Dept:IS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
