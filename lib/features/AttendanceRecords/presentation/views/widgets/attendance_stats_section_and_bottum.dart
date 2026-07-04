import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
// removed unused import
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/attendance_stats_section.dart';

class AttendanceStatsSectionAndBottum extends StatelessWidget {
  const AttendanceStatsSectionAndBottum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AttendanceStatsSection(), // مربعات الإحصائيات الثلاثية الثابتة
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004494),
              ),
              onPressed: () {
                GoRouter.of(context).go(
                  AppPagesName.khistoryView,
                ); // Navigate to the review and submit page
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Review & Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.white, size: 30.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
