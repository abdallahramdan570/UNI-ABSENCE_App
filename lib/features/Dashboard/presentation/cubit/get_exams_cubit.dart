

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/Dashboard/domain/usecase/get_exams_usecase.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/get_exams_state.dart';

class GetExamsCubit extends Cubit<GetExamsState> {
  final GetExamsUseCase getExamsUseCase;

  GetExamsCubit({
    required this.getExamsUseCase,
  }) : super(GetExamsInitial());

  Future<void> getExams({
    required String date,
  }) async {
    print('GetExamsCubit Loading => requested date: $date'); // طباعة بداية الطلب لمعرفة متى تم استدعاء التحميل.

    emit(GetExamsLoading());

    final examsResult = await getExamsUseCase(
      date: date,
    );

    examsResult.fold(
      (failure) {
        print('GetExamsCubit Failure => ${failure.message}'); // طباعة رسالة الفشل القادمة من الـ Repository.
        emit(
          GetExamsFailure(
            errorMessage: failure.message,
          ),
        );
      },
      (exams) {
        print('GetExamsCubit Success => exams count: ${exams.length}'); // طباعة نجاح الطلب مع عدد الامتحانات للتأكد من وصول البيانات.
        emit(
          GetExamsSuccess(
            exams: exams,
          ),
        );
      },
    );
  }
}