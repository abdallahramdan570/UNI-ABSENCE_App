import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';

abstract class AppStyles {
  static const styleTextBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static const styleTextExtraBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColors.primaryBlue,
  );
  static const styleTextMedium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const medium12 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 12,

  letterSpacing: 2,
  );

static const mediumRegular15 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 15,
  
  );

  static const mediumSemiBold13 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    height: 1.38,
  );
}
