import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_absence/core/api/api_consumer.dart';
import 'package:uni_absence/core/api/dio_consumer.dart';
import 'package:uni_absence/features/Dashboard/data/datasources/exam_remote_data_source.dart';
import 'package:uni_absence/features/Dashboard/data/repositories/exam_repository_impl.dart';
import 'package:uni_absence/features/Dashboard/domain/repositories/exam_repository.dart';
import 'package:uni_absence/features/Dashboard/domain/usecases/get_exams_by_date_usecase.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';
import 'package:uni_absence/features/ExamDetails/data/datasources/exam_record_remote_data_source.dart';
import 'package:uni_absence/features/ExamDetails/data/repositories/exam_record_repository_impl.dart';
import 'package:uni_absence/features/ExamDetails/domain/repositories/exam_record_repository.dart';
import 'package:uni_absence/features/ExamDetails/domain/usecases/get_exam_records_usecase.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_cubit.dart';

final sl = GetIt.instance;

void init() {
  // Features - ExamDetails
  sl.registerFactory(() => ExamRecordCubit(getExamRecordsUseCase: sl()));
  sl.registerLazySingleton(() => GetExamRecordsUseCase(repository: sl()));
  sl.registerLazySingleton<ExamRecordRepository>(() => ExamRecordRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ExamRecordRemoteDataSource>(() => ExamRecordRemoteDataSourceImpl(apiConsumer: sl()));

  // Features - Dashboard
  // Bloc
  sl.registerFactory(() => ExamCubit(getExamsByDateUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetExamsByDateUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<ExamRepository>(
    () => ExamRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ExamRemoteDataSource>(
    () => ExamRemoteDataSourceImpl(apiConsumer: sl()),
  );

  // Core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // External
  sl.registerLazySingleton(() => Dio());
}
