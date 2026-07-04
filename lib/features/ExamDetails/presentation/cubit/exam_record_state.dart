import 'package:equatable/equatable.dart';
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';

abstract class ExamRecordState extends Equatable {
  const ExamRecordState();

  @override
  List<Object> get props => [];
}

class ExamRecordInitial extends ExamRecordState {}

class ExamRecordLoading extends ExamRecordState {}

class ExamRecordLoaded extends ExamRecordState {
  final List<ExamRecordEntity> records;

  const ExamRecordLoaded({required this.records});

  @override
  List<Object> get props => [records];
}

class ExamRecordError extends ExamRecordState {
  final String message;

  const ExamRecordError({required this.message});

  @override
  List<Object> get props => [message];
}
