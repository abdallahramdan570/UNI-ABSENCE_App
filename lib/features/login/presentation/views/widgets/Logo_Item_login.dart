// removed unused import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/app_assets.dart';

class LogoItemLogin extends StatelessWidget {
  const LogoItemLogin({super.key});

  @override
  Widget build(BuildContext context) {
  //  final double logoSize = 0.4.sw;
    return Container(
   width: 180.w.clamp(120, 180),
height: 180.w.clamp(120, 180),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: const [BoxShadow(blurRadius: 12, color: Colors.black12)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset(Assets.assetsImagesLogo, fit: BoxFit.fill),
      ),
    );
  }
}
