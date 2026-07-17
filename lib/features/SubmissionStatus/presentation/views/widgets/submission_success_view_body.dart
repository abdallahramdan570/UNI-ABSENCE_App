import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/course_attendance_model.dart';
import 'package:uni_absence/features/SubmissionStatus/presentation/views/widgets/submission_summary_card.dart';
import 'package:uni_absence/features/SubmissionStatus/presentation/views/widgets/success_header_section.dart';

class SubmissionSuccessViewBody extends StatelessWidget {
  const SubmissionSuccessViewBody({super.key,  this.course});
  final CourseAttendanceModel? course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                // 1️⃣ الجزء العلوي: أيقونة النجاح الدائرية المتداخلة
                SuccessHeaderSection(section: course?.section ?? "Section A"),
                SizedBox(height: 24.h),

                // 2️⃣ الجزء الأوسط: كارد ملخص الإرسال الكامل
                SubmissionSummaryCard(
                  course: course,
                ),
              ],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(16.w),
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004494),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              onPressed: () {
                GoRouter.of(context).go(AppPagesName.kdashboardView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Return to Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
