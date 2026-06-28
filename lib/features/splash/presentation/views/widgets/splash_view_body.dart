import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/widgets/custom_Buttom.dart';
import 'package:uni_absence/core/widgets/logo_items.dart';
import 'package:uni_absence/features/login/presentation/views/login_view.dart';
import 'package:uni_absence/features/splash/presentation/views/widgets/divider_items.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),

              FadeInDown(
                duration: const Duration(milliseconds: 1200),
                child: LogoItemwithContainer(),
              ),

              SizedBox(height: 30.h),
              FadeInLeft(
                delay: const Duration(milliseconds: 500),
                child: SvgPicture.asset(
                  Assets.assetsImagesUNIABSENCE,
                  width: 200.w,
                ),
              ),
              SizedBox(height: 10.h),
              FadeInLeft(
                delay: const Duration(milliseconds: 1000),
                child: Text(
                  'Exams. Halls. Records.',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black54),
                ),
              ),

              Expanded(flex: 2, child: SizedBox(height: 70.h)),

              BounceInUp(
                delay: const Duration(milliseconds: 1000),
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    GoRouter.of(context).push(AppPagesName.kloginView);
                  },
                ),
              ),
              Expanded(flex: 1, child: SizedBox(height: 30.h)),
            ],
          ),
        ),
      ),
    );
  }
}
