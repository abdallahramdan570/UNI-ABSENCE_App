import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:uni_absence/features/ExamDetails/domain/repositories/exam_record_repository.dart';

class GetExamRecordsUseCase {
  final ExamRecordRepository repository;

  GetExamRecordsUseCase({required this.repository});

  Future<Either<Failure, List<ExamRecordEntity>>> call(int examId) async {
    return await repository.getExamRecords(examId);
  }
}
