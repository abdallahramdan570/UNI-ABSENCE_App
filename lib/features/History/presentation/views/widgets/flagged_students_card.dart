import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';

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
