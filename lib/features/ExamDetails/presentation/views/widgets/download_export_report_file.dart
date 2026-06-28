import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:path_provider/path_provider.dart';
import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/list_students_data.dart';

class DownloadExportReportFile extends StatelessWidget {
  const DownloadExportReportFile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {},
        
        icon: const Icon(Icons.download, size: 20, color: Color(0xFF757575)),
        label: Text(
          'Export Report (Excel/PDF)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF757575),
          ),
        ),
        style: OutlinedButton.styleFrom(
          minimumSize: Size(290.w, 42.h),
          side: const BorderSide(color: Color(0xFF757575)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// Future<void> exportStudentsToExcel(
//     List<ExamStudentModel> students) async {

//   var excel = Excel.createExcel();

//   Sheet sheet = excel['Students'];

//   sheet.appendRow([
//     TextCellValue('Code'),
//     TextCellValue('Name'),
//     TextCellValue('Department'),
//     TextCellValue('Attendance'),
//   ]);

//   for (var student in students) {
//     sheet.appendRow([
//       TextCellValue(student.code),
//       TextCellValue(student.name),
//       TextCellValue(student.department),
//       TextCellValue(student.attended ? 'Attended' : 'Absent'),
//     ]);
//   }

//   final bytes = excel.encode();

//   if (bytes != null) {
//     final dir = await getApplicationDocumentsDirectory();

//     final file = File(
//       '${dir.path}/students_report.xlsx',
//     );

//     await file.writeAsBytes(bytes);
//   }
// }

// Future<String?> exportStudentsToExcel(List<ExamStudentModel> students) async {
//   var excel = Excel.createExcel();

//   Sheet sheet = excel['Students'];

//   // ...

//   final bytes = excel.encode();

//   if (bytes != null) {
//     final dir = await getApplicationDocumentsDirectory();

//     final file = File('${dir.path}/students_report.xlsx');

//     await file.writeAsBytes(bytes);

//     await OpenFile.open(file.path);
//     await OpenFilex.open(file.path);

//     return file.path;
//   }

//   return null;
// }
