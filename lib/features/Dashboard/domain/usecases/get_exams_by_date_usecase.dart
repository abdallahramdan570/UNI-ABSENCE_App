import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';
import 'package:uni_absence/features/Dashboard/domain/repositories/exam_repository.dart';

class GetExamsByDateUseCase {
  final ExamRepository repository;

  GetExamsByDateUseCase({required this.repository});

  Future<Either<Failure, List<ExamEntity>>> call(String date) async {
    return await repository.getExamsByDate(date);
  }
}
