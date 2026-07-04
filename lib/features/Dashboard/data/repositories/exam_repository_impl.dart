import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/exceptions.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/Dashboard/data/datasources/exam_remote_data_source.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entity.dart';
import 'package:uni_absence/features/Dashboard/domain/repositories/exam_repository.dart';

class ExamRepositoryImpl implements ExamRepository {
  final ExamRemoteDataSource remoteDataSource;

  ExamRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ExamEntity>>> getExamsByDate(String date) async {
    try {
      final exams = await remoteDataSource.getExamsByDate(date);
      return Right(exams);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? "Server Error"));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
