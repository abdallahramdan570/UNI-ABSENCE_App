
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_details_views_body.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_report_table.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/final_statisticscard.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/list_students_data.dart';

class ScrollSection extends StatelessWidget {
  const ScrollSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "FINAL STATISTICS",
              style: AppStyles.styleTextBold20.copyWith(
                color: Colors.blue,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 5.h),
          ),

          SliverToBoxAdapter(
            child: FinalStatisticsCard(
              students: students,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 10.h),
          ),

          SliverToBoxAdapter(
            child: ExamReportTable(
              students: students,
            ),
          ),
        ],
      ),
    );
  }
}