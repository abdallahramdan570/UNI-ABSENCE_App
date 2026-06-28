
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';

class AttendManuallyButtom extends StatelessWidget {
  const AttendManuallyButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xffE2ECF7),
          side: const BorderSide(color: Color(0xffB3CDE8)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
        onPressed: () {
          GoRouter.of(context).push(AppPagesName.kverifyIdentityView);
        },
        child: Text(
          'Attend Manually',
          style: TextStyle(color: const Color(0xff004494), fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
