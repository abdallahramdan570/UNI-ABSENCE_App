import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/course_attendance_model.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/history_body_views.dart' hide CourseAttendanceModel;
import 'package:uni_absence/features/SubmissionStatus/presentation/views/widgets/submission_success_view_body.dart';

class SubmissionSuccessView extends StatelessWidget {
  const SubmissionSuccessView({super.key, required this.course});
  final CourseAttendanceModel course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Submission Status',
          style: TextStyle(
            color: Color(0xff004494),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xff004494),
            ),
          ),
        ],
      ),
      body: SubmissionSuccessViewBody(course: course),
    );
  }
}
