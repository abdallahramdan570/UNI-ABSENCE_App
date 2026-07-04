import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';

abstract class ExamRepository {
  Future<Either<Failure, List<ExamEntity>>> getExamsByDate(String date);
}
