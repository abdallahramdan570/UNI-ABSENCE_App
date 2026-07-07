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
import 'package:uni_absence/features/History/data/dataSource/exam_details_remote_data_source.dart';
import 'package:uni_absence/features/History/data/repo/exam_details_repository.dart';
import 'package:uni_absence/features/History/data/repo/exam_details_repository_impl.dart';
import 'package:uni_absence/features/History/domain/useCase/get_exam_review_data_usecase.dart';
import 'package:uni_absence/features/History/presentation/cubit/exam_details_cubit.dart';
// ... (كل الـ Imports اللي كانت عندك فوق)
import 'package:uni_absence/features/Settings/presentation/cubit/app_global_cubit.dart';


final sl = GetIt.instance; // بنستخدم sl زي ما أنت ماشي في المشروع كله

Future<void> init() async {
  // --- External ---
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // --- Features - Settings ---
  // تسجيل الـ Cubit عشان تقدر تستخدمه بـ sl<AppGlobalCubit>()
  sl.registerLazySingleton(() => AppGlobalCubit());

  // --- Features - ExamDetails ---
  sl.registerFactory(() => ExamRecordCubit(getExamRecordsUseCase: sl()));
  sl.registerLazySingleton(() => GetExamRecordsUseCase(repository: sl()));
  sl.registerLazySingleton<ExamRecordRepository>(() => ExamRecordRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ExamRecordRemoteDataSource>(() => ExamRecordRemoteDataSourceImpl(apiConsumer: sl()));

  // --- Features - History ---
  sl.registerFactory(() => ExamDetailsCubit(getExamReviewDataUseCase: sl()));
  sl.registerLazySingleton(() => GetExamReviewDataUseCase(repository: sl()));
  sl.registerLazySingleton<ExamDetailsRepository>(() => ExamDetailsRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ExamDetailsRemoteDataSource>(() => ExamDetailsRemoteDataSourceImpl(dio: sl()));

  // --- Features - Dashboard ---
  sl.registerFactory(() => ExamCubit(getExamsByDateUseCase: sl()));
  sl.registerLazySingleton(() => GetExamsByDateUseCase(repository: sl()));
  sl.registerLazySingleton<ExamRepository>(() => ExamRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ExamRemoteDataSource>(() => ExamRemoteDataSourceImpl(apiConsumer: sl()));
}