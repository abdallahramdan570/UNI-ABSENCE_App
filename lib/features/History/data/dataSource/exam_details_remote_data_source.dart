import 'package:dio/dio.dart';
import 'package:uni_absence/features/History/data/models/exam_model.dart';
import 'package:uni_absence/features/History/data/models/exam_record_model.dart';

abstract class ExamDetailsRemoteDataSource {
  /// جلب الامتحانات بناءً على التاريخ (الـ API الأول)
  Future<List<ExamModel>> getExamsByDate({required String date});

  /// جلب سجلات الحضور للامتحان بناءً على الـ ExamId (الـ API الثاني)
  Future<List<ExamRecordModel>> getExamRecords({required int examId});
}

class ExamDetailsRemoteDataSourceImpl implements ExamDetailsRemoteDataSource {
  final Dio
  dio; // أو الـ DioConsumer بتاعك حسب اللي مسجله في الـ Service Locator

  ExamDetailsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ExamModel>> getExamsByDate({required String date}) async {
    // Curl: curl -X 'GET' 'https://attendapi.runasp.net/api/Exams/GetExam?date=2026%2F7%2F11'
    final response = await dio.get(
      'https://attendapi.runasp.net/api/Exams/GetExam',
      queryParameters: {'date': date},
    );

    // تحويل الـ List القادمة من السيرفر إلى قائمة من الـ ExamModel
    return (response.data as List)
        .map((json) => ExamModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ExamRecordModel>> getExamRecords({required int examId}) async {
    // Curl: curl -X 'GET' 'https://attendapi.runasp.net/api/Exams/ViewRecord?ExamId=11'
    final response = await dio.get(
      'https://attendapi.runasp.net/api/Exams/ViewRecord',
      queryParameters: {'ExamId': examId},
    );

    // تحويل الـ List القادمة من السيرفر إلى قائمة من الـ ExamRecordModel
    return (response.data as List)
        .map((json) => ExamRecordModel.fromJson(json))
        .toList();
  }
}
