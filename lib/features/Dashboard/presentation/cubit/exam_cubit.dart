import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/Dashboard/domain/usecases/get_exams_by_date_usecase.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  final GetExamsByDateUseCase getExamsByDateUseCase;

  ExamCubit({required this.getExamsByDateUseCase}) : super(ExamInitial());

  Future<void> fetchExamsByDate(String date) async {
    emit(ExamLoading());
    final result = await getExamsByDateUseCase(date);
    
    result.fold(
      (failure) => emit(ExamError(message: failure.message)),
      (exams) => emit(ExamLoaded(exams: exams)),
    );
  }
}
