class ExamModel {
 
  final String examName;
  final int totalStudents;
  final int currentStudents;
  final String examTime;
  final String status;

  const ExamModel({
    required this.examName,
    required this.totalStudents,
    required this.currentStudents,
    required this.examTime,
    required this.status,
  });
}
