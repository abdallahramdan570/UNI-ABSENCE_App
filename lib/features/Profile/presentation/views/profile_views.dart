import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/core/widgets/navigation/custom_bottom_nav_bar.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/profile_views_body.dart';

class ProfileViews extends StatelessWidget {
  const ProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, size: 30, color: AppColors.primaryBlue),
          onPressed: () {},
        ),
        title: const Text('Profile', style: AppStyles.styleTextExtraBold24),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person_2_outlined,
              size: 30,
              color: AppColors.primaryBlue,
            ),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body:  ProfileViewsBody(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3),
    );
  }
}

