import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/core/widgets/navigation/custom_bottom_nav_bar.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/attendance_records_View_body.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';

class AttendanceRecordsViews extends StatelessWidget {
  const AttendanceRecordsViews({super.key, required this.examData});
  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff004494)),
            onPressed: () {
             
              context.go(AppPagesName.kdashboardView);
              
            },
          ),
          title: Text(
            "Attendance Records",
            style: AppStyles.styleTextExtraBold24.copyWith(
              color: AppColors.primaryBlue,
            ),
          ),
          
        ),
        body: AttendanceRecordsViewBody(examData: examData),

        bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
      ),
    );
  }
}
