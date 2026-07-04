import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/final_statistics_item.dart';

class FinalStatisticsCard extends StatelessWidget {
  const FinalStatisticsCard({super.key, required this.students});
  final List<ExamRecordEntity> students;
  @override
  Widget build(BuildContext context) {
    final totalStudents = students.length;

    final presentStudents = students
        .where((student) => student.attended)
        .length;

    final absentStudents = students
        .where((student) => !student.attended)
        .length;
    return Row(
      children: [
        Expanded(
          child: FinalStatisticsItem(
            text: "Total ",
            number: totalStudents,
            color: AppColors.primaryBlue,
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: FinalStatisticsItem(
            text: "Present ",
            number: presentStudents,
            color: Color(0xFF3E4A41),
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: FinalStatisticsItem(
            text: "Absent ",
            number: absentStudents,
            color: AppColors.accentRed,
          ),
        ),
      ],
    );
  }
}
