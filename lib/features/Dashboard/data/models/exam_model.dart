import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.id,

    required super.sectorId,
    required super.examName,
    required super.examDate,
    required super.examStart,
    required super.examEnd,
    required super.studentsCount,
    required super.studentTotals,
    required super.currentStudents,
    required super.status,
  });

  // factory ExamModel.fromJson(Map<String, dynamic> json) {
  //   return ExamModel(
  //     id: json['id'] ?? 0,
  //     sectorId: json['sectorId'] ?? 0,
  //     examName: json['name'] ?? 'Unknown Exam',
  //     examDate: json['examDate'] ?? '',
  //     examStart: json['examStart'] ?? '',
  //     examEnd: json['examEnd'] ?? '',
  //     studentsCount: json['studentsCount'] ?? json['currentStudents'] ?? 0,
  //     studentTotals: json['totalStudents'] ,
  //     currentStudents: json['currentStudents'] ?? 0,
  //     status: int.tryParse('${json['status'] ?? 0}') ?? 0,
  //  );


  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] ?? 0,

      sectorId: json['sectorId'] ?? 0,

      examName: json['name'] ?? '',

      // بما أن الـ API لا يرجع examDate
      // نستخدم examStart كتاريخ
      examDate: json['examStart'] ?? '',

      examStart: json['examStart'] ?? '',

      examEnd: json['examEnd'] ?? '',

      studentsCount: json['studentsCount'] ?? 0,

      studentTotals: json['studentTotal'] ?? 0,

      // غير موجودين حالياً في الـ API
      currentStudents: json['currentStudents'] ?? 0,

      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sectorId": sectorId,
      "name": examName,
      "examDate": examDate,
      "examStart": examStart,
      "examEnd": examEnd,
      "studentsCount": studentsCount,
      "studentTotal": studentTotals,
      "currentStudents": currentStudents,
      "status": status,
    };
  }
}
  
