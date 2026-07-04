import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/exceptions.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/ExamDetails/data/datasources/exam_record_remote_data_source.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:uni_absence/features/ExamDetails/domain/repositories/exam_record_repository.dart';

class ExamRecordRepositoryImpl implements ExamRecordRepository {
  final ExamRecordRemoteDataSource remoteDataSource;

  ExamRecordRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ExamRecordEntity>>> getExamRecords(int examId) async {
    try {
      final records = await remoteDataSource.getExamRecords(examId);
      return Right(records);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? "Server Error"));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
