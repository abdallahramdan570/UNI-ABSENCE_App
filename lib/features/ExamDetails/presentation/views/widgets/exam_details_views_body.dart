import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';

import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/download_export_report_file.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_report_info_card.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/list_students_data.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/scroll_section.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_cubit.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_state.dart';

class ExamDetailsViewsBody extends StatelessWidget {
  const ExamDetailsViewsBody({super.key, required this.examData});

  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExamReportInfoCard(
            courseName: examData.examName,
            examDate: DateTime.parse(examData.examStart),
            examTime: examData.examTime,
            status: examData.examStatus,
          ),

          SizedBox(height: 20.h),
          const ScrollSection(),
          SizedBox(height: 20.h),
          // Export button will use loaded records from ExamRecordCubit
          BlocBuilder<ExamRecordCubit, ExamRecordState>(
            builder: (context, state) {
              if (state is ExamRecordLoaded) {
                return DownloadExportReportFile(
                  examName: examData.examName,
                  studentsList: state.records,
                );
              }

              // Default to disabled button while loading or on error
              return DownloadExportReportFile(
                examName: examData.examName,
                studentsList: [],
              );
            },
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
