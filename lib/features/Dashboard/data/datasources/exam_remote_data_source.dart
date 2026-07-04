import 'package:uni_absence/core/api/api_consumer.dart';
import 'package:uni_absence/core/api/end_points.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';

abstract class ExamRemoteDataSource {
  Future<List<ExamModel>> getExamsByDate(String date);
}

class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ApiConsumer apiConsumer;

  ExamRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<ExamModel>> getExamsByDate(String date) async {
    final response = await apiConsumer.get(
      EndPoints.getExams,
      queryParameters: {
        'date': date,
      },
    );

    if (response is List) {
      return response.map((json) => ExamModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
