import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

class SettingsandSecuritySessionCard extends StatelessWidget {
  const SettingsandSecuritySessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Icon(Icons.settings, color: AppColors.primaryBlue, size: 25),
                SizedBox(width: 8.w),
                Text(
                  'Settings & Security',
                  style: AppStyles.styleTextBold20.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
            Divider(
              height: 25.h,
              indent: 10,
              endIndent: 10,
              color: Colors.grey.shade700,
            ),

            NotificationSection(),
            SizedBox(height: 12.h),
            LanguageSection(),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.language, color: Colors.grey.shade700, size: 24.sp),
        SizedBox(width: 7.w),
        Text(
          'Language',
          style: AppStyles.styleTextBold20.copyWith(
            color: Colors.grey.shade700,
            fontSize: 17.sp,
          ),
        ),
        Spacer(),
        Row(
          children: [
            SizedBox(width: 8.w),
            Text(
              'English',
              style: AppStyles.styleTextBold20.copyWith(
                color: AppColors.primaryBlue,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: Colors.grey.shade700,
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ],
    );
  }
}

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.notifications, color: Colors.grey.shade700, size: 24.sp),
        SizedBox(width: 8.w),
        Text(
          'Notification',
          style: AppStyles.styleTextBold20.copyWith(
            color: Colors.grey.shade700,
            fontSize: 17.sp,
          ),
        ),
        Spacer(),
        Switch(
          value: false, // Replace with your actual notification state
          onChanged: (bool value) {
            // Handle switch state change
          },
          activeThumbColor: AppColors.primaryBlue,
        ),
      ],
    );
  }
}
