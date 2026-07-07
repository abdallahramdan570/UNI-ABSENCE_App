
import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/History/data/repo/exam_details_repository.dart';

class GetExamReviewDataUseCase {
  final ExamDetailsRepository repository;

  GetExamReviewDataUseCase({required this.repository});

  /// دالة الـ call بتخلينا نستدعي الكلاس كأنه دالة مباشرة في الكيوبيت
  Future<Either<Failure, Map<String, dynamic>>> call({
    required int examId,
    required String date,
  }) async {
    return await repository.getExamReviewData(examId: examId, date: date);
  }
}