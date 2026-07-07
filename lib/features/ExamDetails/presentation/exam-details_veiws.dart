import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_details_views_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/core/di/dependency_injection.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_cubit.dart';

class ExamDetailsViews extends StatelessWidget {
  const ExamDetailsViews({super.key, required this.examData});

  final ExamModel examData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExamRecordCubit>()..fetchExamRecords(examData.id),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).appBarTheme.backgroundColor ??
              Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: const Text('Exam Details'),
        ),
        body: ExamDetailsViewsBody(examData: examData),
      ),
    );
  }
}
