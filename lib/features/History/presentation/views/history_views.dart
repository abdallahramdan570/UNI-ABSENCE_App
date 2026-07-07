import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/core/widgets/custom_Buttom.dart';
import 'package:uni_absence/core/widgets/navigation/custom_bottom_nav_bar.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';
import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/list_students_data.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/history_body_views.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/review_card.dart';

class HistoryViews extends StatelessWidget {
  const HistoryViews({super.key, required this.exam});

  final ExamEntity exam;
  @override
  Widget build(BuildContext context) {
    final course = CourseAttendanceModel(
  courseName: "Human Computer Interaction",
  section: "Section A",
  students: students,
  lockTime: "June 21, 2026 10:30 AM",
);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.primaryBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
          GoRouter.of(context).push(
      AppPagesName.ksubmissionStatusView,
      extra: course,
    );
          },
        ),
        title: Text(
          'REVIEW & FINAL COMMIT',
          style: AppStyles.styleTextBold20.copyWith(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: HistoryBodyViews(exam: course),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }
}

class FlaggedStudentsCard extends StatelessWidget {
 const  FlaggedStudentsCard({super.key, required this.students});
final List<ExamStudentModel> students;
  @override
  Widget build(BuildContext context) {
 final absentStudentsList =
        students
            .where((e) => !e.attended)
            .toList();
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: absentStudentsList.map((student) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    student.name,
                    style: AppStyles.mediumRegular15.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 18),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
