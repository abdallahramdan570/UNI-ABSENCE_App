
import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/student_table_row.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/table_header.dart';

class ExamReportTable extends StatelessWidget {
  const ExamReportTable({
    super.key,
    required this.students,
  });

  final List<ExamRecordEntity> students;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          const TableHeader(),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return StudentTableRow(
                student: students[index],
              );
            },
          ),
        ],
      ),
    );
  }
}