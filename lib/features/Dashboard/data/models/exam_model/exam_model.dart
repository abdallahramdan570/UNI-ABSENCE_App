import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';

class ExamModel extends ExamEntity {
  const ExamModel({
    required super.id,
    required super.sectorId,
    required super.name,
    required super.examDate,
    required super.examStart,
    required super.examEnd,
    
    
  });

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'],
      sectorId: json['sectorId'],
      name: json['name'],
      examDate: json['examDate'],
      examStart: json['examStart'],
      examEnd: json['examEnd'],
      // totalStudents: json['totalStudents'],
      // examName: json['examName'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sectorId": sectorId,
      "name": name,
      "examDate": examDate,
      "examStart": examStart,
      "examEnd": examEnd,
    };
  }
}