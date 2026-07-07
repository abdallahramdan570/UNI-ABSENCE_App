import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';

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
