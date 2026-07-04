import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';
import 'package:uni_absence/features/Dashboard/repo/home_repo.dart';

class GetExamsUseCase {
  final HomeRepo homeRepo;

  GetExamsUseCase(this.homeRepo);

  Future<Either<Failure, List<ExamEntity>>> call({
    required String date,
  }) {
    return homeRepo.getExams(
      date: date,
      
    );
  }
}