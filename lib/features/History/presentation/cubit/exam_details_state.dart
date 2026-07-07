import 'package:equatable/equatable.dart';
import 'package:uni_absence/features/History/domain/entity/exam_entity.dart';
import 'package:uni_absence/features/History/domain/entity/exam_record_entity.dart';

abstract class ExamDetailsState extends Equatable {
  const ExamDetailsState();

  @override
  List<Object?> get props => [];
}

class ExamDetailsInitial extends ExamDetailsState {}

class ExamDetailsLoading extends ExamDetailsState {}

class ExamDetailsSuccess extends ExamDetailsState {
  final ExamEntity exam;
  final List<ExamRecordEntity> studentRecords;

  const ExamDetailsSuccess({
    required this.exam,
    required this.studentRecords,
  });

  @override
  List<Object?> get props => [exam, studentRecords];
}

class ExamDetailsFailure extends ExamDetailsState {
  final String errorMessage;

  const ExamDetailsFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}