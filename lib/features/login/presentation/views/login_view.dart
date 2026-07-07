import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/core/widgets/custom_appbar.dart';
// removed unused imports
import 'package:uni_absence/features/login/presentation/views/widgets/Box_login_form.dart';
import 'package:uni_absence/features/login/presentation/views/widgets/Logo_Item_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: CustomAppBar()),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              LogoItemLogin(),
              SizedBox(height: 10.h),
              Text(
                'Administrative Portal',
                style: AppStyles.styleTextExtraBold24,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 2.h),
              Text(
                "SECURE ACCESS REQUIRED",
                style: AppStyles.medium12.copyWith(
                  color: AppColors.textSubtitle,
                ),

                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              BoxLoginform(),
            ],
          ),
        ),
      ),
    );
  }
}
