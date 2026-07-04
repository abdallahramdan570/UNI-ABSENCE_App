import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';

abstract class ExamRecordRepository {
  Future<Either<Failure, List<ExamRecordEntity>>> getExamRecords(int examId);
}
