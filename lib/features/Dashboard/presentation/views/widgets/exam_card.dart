
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/dashBord_buttom.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/text_and_number_student.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/time_exam.dart';

class ExamCard extends StatelessWidget {
   ExamCard({super.key, required this.examData});
  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
      bool isCompleted = examData.currentStudents == examData.totalStudents;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TextAndNumberStudent(textTotalStudent: examData.totalStudents, textCurrentStudent: examData.currentStudents),
           SizedBox(height: 10.h),
            Text(
              examData.examName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleTextBold20.copyWith(color: Colors.black),
            ),
            SizedBox(height: 16.h),

            TimeExam(
              dataExam: examData.examTime,
              isCompleted: isCompleted,
            ),
            SizedBox(height: 25.h),
            DashBordButtom(isCompleted: isCompleted, examData: examData),


          ],
        ),
      ),
    );
  }
}
