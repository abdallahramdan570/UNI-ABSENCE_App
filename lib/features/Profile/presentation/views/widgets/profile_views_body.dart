import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/account_information_card.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/active_session_card.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/profile_header_section.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/settings_security_session_Card.dart';

class ProfileViewsBody extends StatelessWidget {
  const ProfileViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ProfileHeaderSection(),
            SizedBox(height: 24.h),
            AccountInformationCard(),
            SizedBox(height: 24.h),
            ActiveSessionCard(),
            SizedBox(height: 24.h),
            SettingsandSecuritySessionCard(),
            SizedBox(height: 24.h),
            CustomButtomLogout(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class CustomButtomLogout extends StatelessWidget {
  const CustomButtomLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
     GoRouter.of(context).go('/login');
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5),
          color: Color(0xFFE7E8F0),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.red, size: 24),
            SizedBox(width: 8.w),
            Center(
              child: Text(
                'LOGOUT',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
