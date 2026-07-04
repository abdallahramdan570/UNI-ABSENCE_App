import 'dart:developer'
    as developer; // تم استخدام logger بدل print لتقليل تحذيرات التحليل مع الحفاظ على تتبع الديبج.

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl =
      "https://attendapi.runasp.net/api/"; // تم تعديل الرابط الأساسي لتجميع الـ endpoint بطريقة صحيحة.

  ApiService(this.dio);

  Future<List<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    ); // تم بناء الرابط النهائي باستخدام queryParameters لتفادي أخطاء تنسيق الـ URL.

    developer.log(
      'ApiService URL => $uri',
      name: 'ApiService',
    ); // تم تسجيل الرابط النهائي للتأكد من صحة الطلب أثناء الـ Debug.
    final Response response = await dio.getUri(uri);
    developer.log(
      'ApiService Status Code => ${response.statusCode}',
      name: 'ApiService',
    ); // تم تسجيل كود الاستجابة لمعرفة نجاح أو فشل الاتصال.
    developer.log(
      'ApiService Response Body => ${response.data}',
      name: 'ApiService',
    ); // تم تسجيل جسم الاستجابة لمراجعة شكل البيانات القادمة من الـ API.

    final dynamic responseData = response.data;

    if (responseData is List<dynamic>) {
      return responseData; // تم الإرجاع مباشرة لأن الـ API في هذه الحالة ترجع List.
    }

    if (responseData is Map<String, dynamic> &&
        responseData['data'] is List<dynamic>) {
      return responseData['data']
          as List<
            dynamic
          >; // تم دعم حالة Map احتياطياً إذا كانت البيانات الفعلية داخل المفتاح data.
    }

    throw FormatException(
      'Unexpected API response type: ${responseData.runtimeType}',
    ); // تم رمي خطأ واضح عند وصول شكل بيانات غير متوقع.
  }
}
