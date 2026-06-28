import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/core/widgets/custom_Buttom.dart';
import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';
import 'package:uni_absence/features/History/presentation/views/history_views.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/review_card.dart';

class HistoryBodyViews extends StatelessWidget {
  const HistoryBodyViews({
    super.key,
    required this.exam,
  });

  final CourseAttendanceModel exam;

  @override
  Widget build(BuildContext context) {
    final absentStudents =
        exam.students.where((s) => !s.attended).length;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "REVIEW & FINAL COMMIT",
              style:
                  AppStyles.styleTextExtraBold24.copyWith(
                color: Colors.black,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 14),

            ReviewCard(
              exam: exam,
            ),

            const SizedBox(height: 19),

            FlaggedStudentsCard(
              students: exam.students,
            ),

            const SizedBox(height: 12),

            Text(
              '$absentStudents students flagged for final verification in ${exam.courseName}.',
            ),

            const SizedBox(height: 28),

            CustomButton(
              text: 'Confirm & Final Submission',
              onPressed: () {
                GoRouter.of(context).push(
                  AppPagesName.ksubmissionStatusView,
                  extra: exam,
                );
              },
              backgroundColor: Colors.green,
            ),

            const SizedBox(height: 15),

            CustomButton(
              text: 'Edit Sheet',
              onPressed: () {
                GoRouter.of(context).push(
                  AppPagesName.kattendanceView,
                );
              },
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class CourseAttendanceModel {
  final String courseName;
  final String section;
  final String? lockTime;
  final List<ExamStudentModel> students;

  CourseAttendanceModel({

    required this.courseName,
    required this.section,
     this.lockTime, 
    required this.students,
  });
}