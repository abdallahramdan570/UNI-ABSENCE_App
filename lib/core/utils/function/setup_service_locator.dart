import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_absence/core/utils/api_service.dart';
import 'package:uni_absence/features/Dashboard/data/models/datasource/home_remote_data_source.dart';
// removed unused import

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  ); // تم تسجيل ApiService كـ Singleton لتوفير الوصول العالمي إلى الـ Service Locator.
  getIt.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
  ); // تم تسجيل HomeRemoteDataSourceImpl كـ Singleton لتوفير الوصول العالمي إلى الـ Service Locator.
}
