import 'dart:developer'
    as developer; // تم استخدام logger بدل print لتسجيل النجاح والفشل داخل الـ Repository.

import 'package:dartz/dartz.dart'; // Returns a typed success or failure result from the repository.
import 'package:dio/dio.dart'; // Lets the repository catch API-specific network failures.
import 'package:uni_absence/core/errors/failure.dart'; // Converts low-level errors into domain failures.
import 'package:uni_absence/features/Dashboard/data/models/datasource/home_remote_data_source.dart'; // Reads exams from the remote datasource.
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart'; // Returns domain entities to the use case layer.
import 'package:uni_absence/features/Dashboard/repo/home_repo.dart'; // Keeps the repository contract unchanged.

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource
  homeRemoteDataSource; // Stores the injected datasource for exam requests.

  HomeRepoImpl(
    this.homeRemoteDataSource,
  ); // Receives the datasource through constructor injection.

  @override
  Future<Either<Failure, List<ExamEntity>>> getExams({
    required String date,
  }) async {
    try {
      final exams = await homeRemoteDataSource.getExams(
        date: date,
      ); // Delegates the API call to the remote datasource.

      developer.log(
        'HomeRepoImpl Success => fetched ${exams.length} exams',
        name: 'HomeRepoImpl',
      ); // تم تسجيل نجاح العملية وعدد الامتحانات بعد رجوع البيانات من الـ DataSource.

      return right(
        exams,
      ); // Returns the exams unchanged when the request succeeds.
    } catch (e) {
      if (e is DioException) {
        developer.log(
          'HomeRepoImpl Failure (Dio) => ${e.message}',
          name: 'HomeRepoImpl',
        ); // تم تسجيل فشل الشبكة القادم من Dio لتوضيح سبب الخطأ.
        return left(
          ServerFailure(message: e.message ?? e.type.toString()),
        ); // Maps Dio failures into the shared server failure type.
      }

      developer.log(
        'HomeRepoImpl Failure (Unknown) => $e',
        name: 'HomeRepoImpl',
      ); // تم تسجيل أي فشل غير متوقع قبل تحويله إلى Failure.

      return left(
        ServerFailure(message: e.toString()),
      ); // Falls back to a generic failure for non-Dio exceptions.
    }
  }
}
