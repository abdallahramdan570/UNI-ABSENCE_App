class StudentAttendanceModel {
  final String id;
  final String level;
  final String department;
  final String name;
  final String attendTime;
  final String? leaveTime;
  final bool attended;
  final bool left;

  const StudentAttendanceModel({
    required this.id,
    required this.level,
    required this.department,
    required this.name,
    required this.attendTime,
    required this.leaveTime,
    required this.attended,
    required this.left,
  });
}