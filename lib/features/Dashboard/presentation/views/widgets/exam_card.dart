import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/dashBord_buttom.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/text_and_number_student.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/time_exam.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.examData});

  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
    // ✅ الحالة الصح من الـ Entity
    final isCompleted = examData.examStatus == "Completed";

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👇 عدد الطلبة
            TextAndNumberStudent(
              textTotalStudent: examData.studentTotals,
              textCurrentStudent: examData.studentsCount,
            ),

            SizedBox(height: 10.h),

            // 👇 اسم المادة
            Text(
              examData.examName,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleTextBold20.copyWith(color: Colors.black),
            ),

            SizedBox(height: 16.h),

            // 👇 الوقت + الحالة
            TimeExam(dataExam: examData.examTime, status: examData.examStatus),

            SizedBox(height: 25.h),

            // 👇 زرار الداشبورد
            DashBordButtom(isCompleted: isCompleted, examData: examData),
          ],
        ),
      ),
    );
  }
}
