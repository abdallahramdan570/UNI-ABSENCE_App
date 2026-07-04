import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';

class GetExamsState {}

class GetExamsInitial extends GetExamsState {}

class GetExamsLoading extends GetExamsState {}

class GetExamsSuccess extends GetExamsState {
  final List<ExamEntity> exams;
  GetExamsSuccess({required this.exams});
}

class GetExamsFailure extends GetExamsState {
  final String errorMessage;
  GetExamsFailure({required this.errorMessage});
}
