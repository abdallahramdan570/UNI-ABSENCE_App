import 'package:dartz/dartz.dart';
import 'package:uni_absence/core/errors/failure.dart';
import 'package:uni_absence/features/History/data/dataSource/exam_details_remote_data_source.dart';
import 'package:uni_absence/features/History/data/repo/exam_details_repository.dart';
import 'package:uni_absence/features/History/domain/entity/exam_entity.dart';
import 'package:uni_absence/features/History/domain/entity/exam_record_entity.dart';

class ExamDetailsRepositoryImpl implements ExamDetailsRepository {
  final ExamDetailsRemoteDataSource remoteDataSource;

  ExamDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getExamReviewData({
    required int examId,
    required String date,
  }) async {
    try {
      // 1. جلب امتحانات اليوم بالكامل (الـ API الأول)
      final allExams = await remoteDataSource.getExamsByDate(date: date);

      // العثور على الامتحان المحدد المطلوب عرضه في الشاشة بناءً على الـ ID
      final currentExam = allExams.firstWhere(
        (exam) => exam.id == examId,
        orElse: () => throw Exception("Exam not found for the provided ID"),
      );

      // 2. جلب سجل حضور الطلاب لهذا الامتحان (الـ API الثاني)
      final studentRecords = await remoteDataSource.getExamRecords(
        examId: examId,
      );

      // 3. دمج الكائنين النقيين (Entities) معاً في خريطة (Map) لتسليمها لطبقة الـ Presentation
      return Right({'exam': currentExam, 'records': studentRecords});
    } catch (error) {
      // إمساك الأخطاء وتحويلها لـ Failure صريح ومفهوم للتطبيق
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
