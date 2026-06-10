
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/utils/color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.school_outlined, color: AppColors.primaryBlue),
        SizedBox(width: 12.w),
        SvgPicture.asset(Assets.assetsImagesUNIABSENCE, height: 18.h),
        SizedBox(width: 8.w),
      ],
    );
  }
}