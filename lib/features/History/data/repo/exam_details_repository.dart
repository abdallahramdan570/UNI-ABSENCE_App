import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/History/domain/entity/exam_entity.dart';
import 'package:uni_absence/features/History/domain/entity/exam_record_entity.dart';

abstract class ExamDetailsRepository {
  /// دالة تجلب تفاصيل الامتحان وسجلات الحضور معاً مدموجين في طرد واحد للـ UseCase
  Future<Either<Failure, Map<String, dynamic>>> getExamReviewData({
    required int examId,
    required String date,
  });
}
