class ExamEntity {
  final int id;
  final int sectorId;
  final String name;
  final String examDate;
  final String examStart;
  final String examEnd;

  const ExamEntity({
    required this.id,
    required this.sectorId,
    required this.name,
    required this.examDate,
    required this.examStart,
    required this.examEnd,
  });
}