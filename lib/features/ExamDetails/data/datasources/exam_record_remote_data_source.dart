import 'package:uni_absence/core/api/api_consumer.dart';
import 'package:uni_absence/core/api/end_points.dart';
import 'package:uni_absence/features/ExamDetails/data/model/exam_student_model.dart';

abstract class ExamRecordRemoteDataSource {
  Future<List<ExamStudentModel>> getExamRecords(int examId);
}

class ExamRecordRemoteDataSourceImpl implements ExamRecordRemoteDataSource {
  final ApiConsumer apiConsumer;

  ExamRecordRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<ExamStudentModel>> getExamRecords(int examId) async {
    final response = await apiConsumer.get(
      EndPoints.getViewRecord,
      queryParameters: {
        'ExamId': examId,
      },
    );

    if (response is List) {
      return response.map((json) => ExamStudentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
