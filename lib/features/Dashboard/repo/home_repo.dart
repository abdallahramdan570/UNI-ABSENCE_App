import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ExamEntity>>> getExams({required String date});
}
