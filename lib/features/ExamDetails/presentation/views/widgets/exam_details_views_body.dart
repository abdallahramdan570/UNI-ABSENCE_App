import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/download_export_report_file.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_report_info_card.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/scroll_section.dart';
class ExamDetailsViewsBody extends StatelessWidget {
  const ExamDetailsViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExamReportInfoCard(
            courseName: "Computer Science - HCI",
            examDate: DateTime(2026, 6, 15),
            examTime: "10:00 AM - 12:00 PM ",
          ),
          SizedBox(height: 20.h),
          ScrollSection(),
          SizedBox(height: 20.h),
          const DownloadExportReportFile(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
