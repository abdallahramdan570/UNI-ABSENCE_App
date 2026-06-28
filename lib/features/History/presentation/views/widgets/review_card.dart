import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/list_students_data.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/history_body_views.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/statistic_item_in_card.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.exam});
  final CourseAttendanceModel exam;

  @override
  Widget build(BuildContext context) {
    final checkedStudents = exam.students.length;
    final presentStudents =
    exam.students.where((student) => student.attended).length;
    final absentStudents =
    exam.students.where((student) => !student.attended).length;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 2,

            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(
            '${exam.courseName} REVIEW',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
SizedBox(height: 4),
          Text(
            '(${exam.section} - $checkedStudents Students)',
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
          SizedBox(height: 8),
          Divider(
            thickness: 1,
            endIndent: 20,
            indent: 20,
            color: Colors.grey.shade500,
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticItemInCard(
                title: 'CHECKED',
                value: '$checkedStudents/${students.length}',
                color: Colors.blue,
              ),
              StatisticItemInCard(
                title: 'PRESENT',
                value: presentStudents.toString(),
                color: Colors.green,
              ),

              StatisticItemInCard(
                title: 'ABSENT',
                value: absentStudents.toString(),
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
