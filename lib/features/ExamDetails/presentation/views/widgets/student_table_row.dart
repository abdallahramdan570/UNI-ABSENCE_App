
import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';

class StudentTableRow extends StatelessWidget {
  const StudentTableRow({super.key, required this.student});

  final ExamRecordEntity student;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              student.code,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(flex: 3, child: Text(student.name, maxLines: 2)),

          Expanded(child: Text(student.department)),

          Expanded(
            child: Center(
              child: CircleAvatar(
                radius: 14,
                backgroundColor: student.attended
                    ? const Color(0xff435246)
                    : Colors.red,
                child: Icon(
                  student.attended ? Icons.check : Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
