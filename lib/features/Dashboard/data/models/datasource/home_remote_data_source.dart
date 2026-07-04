import 'dart:developer'
    as developer; // تم استخدام logger بدل print للحفاظ على رسائل الديبج بدون تحذيرات avoid_print.

import 'package:uni_absence/core/utils/api_service.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model/exam_model.dart';
import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';

abstract class HomeRemoteDataSource {
  Future<List<ExamEntity>> getExams({required String date});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ExamEntity>> getExams({required String date}) async {
    final data = await apiService.get(
      endpoint:
          'Exams/GetExam', // تم فصل الـ endpoint عن الـ query لتحسين تكوين الرابط.
      queryParameters: {
        'date': date,
      }, // تم تمرير التاريخ كـ query parameter لضمان توافق الطلب مع الـ API.
    );

    developer.log(
      'HomeRemoteDataSource Raw Data => $data',
      name: 'HomeRemoteDataSource',
    ); // تم تسجيل البيانات الخام قبل التحويل لتسهيل تتبع مشكلة عدم ظهور البيانات.
    developer.log(
      'HomeRemoteDataSource Items Count => ${data.length}',
      name: 'HomeRemoteDataSource',
    ); // تم تسجيل عدد العناصر للتأكد أن القائمة ليست فارغة.

    final List<ExamEntity> exams =
        []; // تم تعريف القائمة النهائية التي ستحمل الكيانات بعد التحويل.

    for (final exam in data) {
      exams.add(
        ExamModel.fromJson(
          exam as Map<String, dynamic>,
        ), // تم التحويل الصريح إلى Map ثم إلى ExamModel.fromJson لضبط الـ Generic Types.
      );
    }

    return exams;
  }
}
