
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/app_assets.dart';

class LogoItemwithContainer extends StatelessWidget {
  const LogoItemwithContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: const [
          BoxShadow(blurRadius: 12, color: Colors.black12),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(Assets.assetsImagesLogo),
      ),
    );
  }
}
