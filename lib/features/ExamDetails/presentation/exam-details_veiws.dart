
import 'package:flutter/material.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_details_views_body.dart';

class ExamDetailsViews extends StatelessWidget {
  const ExamDetailsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exam Details')),
      body: const ExamDetailsViewsBody(),
    );
  }
}
