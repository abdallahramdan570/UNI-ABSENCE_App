import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/History/domain/useCase/get_exam_review_data_usecase.dart';
import 'package:uni_absence/features/History/presentation/cubit/exam_details_state.dart';

class ExamDetailsCubit extends Cubit<ExamDetailsState> {
  final GetExamReviewDataUseCase getExamReviewDataUseCase;

  ExamDetailsCubit({required this.getExamReviewDataUseCase}) : super(ExamDetailsInitial());

  /// دالة جلب البيانات المدموجة من الـ UseCase وفك الطرد بـ fold
  Future<void> fetchExamReviewData({required int examId, required String date}) async {
    emit(ExamDetailsLoading());

    final result = await getExamReviewDataUseCase.call(examId: examId, date: date);

    result.fold(
      // في حالة الفشل (Left)
      (failure) => emit(ExamDetailsFailure(errorMessage: failure.message)),
      
      // في حالة النجاح (Right) نقوم بفك طرد الـ Map وتمرير الأجسام الصافية للـ UI
      (dataMap) {
        emit(ExamDetailsSuccess(
          exam: dataMap['exam'],
          studentRecords: dataMap['records'],
        ));
      },
    );
  }
}