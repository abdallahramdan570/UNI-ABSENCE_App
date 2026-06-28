// import 'dart:io';

// import 'package:excel/excel.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';


// Future<void> exportStudentsToExcel(
//   List<ExamStudentModel> students,
// ) async {
//   try {
//     final excel = Excel.createExcel();

//     final sheet = excel['Students'];

//     sheet.appendRow([
//       TextCellValue('Code'),
//       TextCellValue('Name'),
//       TextCellValue('Department'),
//       TextCellValue('Attendance'),
//     ]);

//     for (final student in students) {
//       sheet.appendRow([
//         TextCellValue(student.code),
//         TextCellValue(student.name),
//         TextCellValue(student.department),
//         TextCellValue(
//           student.attended ? 'Present' : 'Absent',
//         ),
//       ]);
//     }

//     final bytes = excel.encode();

//     if (bytes == null) return;

//     final dir = await getApplicationDocumentsDirectory();

//     final file = File(
//       '${dir.path}/students_report.xlsx',
//     );

//     await file.writeAsBytes(bytes);

//     await OpenFilex.open(file.path);
//   } catch (e) {
//     print('Export Error: $e');
//   }
// }