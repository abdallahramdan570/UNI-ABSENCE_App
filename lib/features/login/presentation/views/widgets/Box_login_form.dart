import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// removed unused import
import 'package:uni_absence/core/widgets/validator/app_validators.dart';
import 'package:uni_absence/core/widgets/custom_Buttom.dart';
import 'package:uni_absence/features/login/presentation/views/widgets/Login_Form_section.dart';
import 'package:uni_absence/features/login/presentation/views/widgets/SecurityBanner.dart';

class BoxLoginform extends StatefulWidget {
  const BoxLoginform({super.key});

  @override
  State<BoxLoginform> createState() => _BoxLoginformState();
}

class _BoxLoginformState extends State<BoxLoginform> {
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw.clamp(300, 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25.h),
            const SecurityBanner(),

            SizedBox(height: 20.h),
            LoginFormSection(
              nextFocusNode: emailFocusNode,
              label: 'Admin ID / Email',

              hintText: "Enter your Admin ID or Email",

              icon: Icons.person_outline,
              validator: AppValidators.validateAdminIdOrEmail,
            ),
            SizedBox(height: 10.h),

            LoginFormSection(
              nextFocusNode: passwordFocusNode,
              validator: AppValidators.validatePassword,
              label: 'Password',
              hintText: "passWord",
              icon: Icons.lock_outline,
              isPassword: true,
              //  validator: AppValidators.validatePassword,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomButton(
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    GoRouter.of(context).push('/dashboard');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
