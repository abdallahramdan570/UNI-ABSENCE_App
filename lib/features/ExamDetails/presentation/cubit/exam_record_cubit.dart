import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/ExamDetails/domain/usecases/get_exam_records_usecase.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_state.dart';

class ExamRecordCubit extends Cubit<ExamRecordState> {
  final GetExamRecordsUseCase getExamRecordsUseCase;

  ExamRecordCubit({required this.getExamRecordsUseCase}) : super(ExamRecordInitial());

  Future<void> fetchExamRecords(int examId) async {
    emit(ExamRecordLoading());
    final result = await getExamRecordsUseCase(examId);

    result.fold(
      (failure) => emit(ExamRecordError(message: failure.message)),
      (records) => emit(ExamRecordLoaded(records: records)),
    );
  }
}
