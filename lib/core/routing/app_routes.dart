import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/attendance_records_views.dart';

import 'package:uni_absence/features/Dashboard/domain/entities/exam_entities.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/dashboard_views.dart';
import 'package:uni_absence/features/ExamDetails/presentation/exam-details_veiws.dart';
import 'package:uni_absence/features/History/presentation/views/history_views.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/course_attendance_model.dart';
import 'package:uni_absence/features/Profile/presentation/views/profile_views.dart';
import 'package:uni_absence/features/Settings/presentation/views/settings_views.dart';
import 'package:uni_absence/features/SubmissionStatus/presentation/views/submission_status_view.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/verify_identity_view.dart';
import 'package:uni_absence/features/login/presentation/views/login_view.dart';
import 'package:uni_absence/features/splash/presentation/views/splash_views.dart';

import '../../features/Dashboard/data/models/exam_model.dart';


abstract class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashViews()),
      GoRoute(
        path: AppPagesName.kloginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: AppPagesName.kdashboardView,
        builder: (context, state) => const DashboardViews(),
      ),

      GoRoute(
        path: AppPagesName.khistoryView,
        builder: (context, state) {
          return HistoryViews(
         
          );
        },
      ),
      GoRoute(
        path: AppPagesName.kprofileView,
        builder: (context, state) => const ProfileViews(),
      ),
      GoRoute(
        path: AppPagesName.ksettingsView,
        builder: (context, state) => const SettingsViews(),
      ),
      GoRoute(
        path: AppPagesName.kexamDetailsView,
        builder: (context, state) {
          final examData = state.extra as ExamModel;
          return ExamDetailsViews(examData: examData);
        },
      ),
      GoRoute(
        path: AppPagesName.ksubmissionStatusView,
        builder: (context, state) {
        

          return SubmissionSuccessView();
        },
      ),
      GoRoute(
        path: AppPagesName.ksettingsView,
        builder: (context, state) => const SettingsViews(),
      ),
      GoRoute(
        path: AppPagesName.kattendanceView,
        builder: (context, state) {
return AttendanceRecordsViews(
            examData: state.extra as ExamModel,
          );
        },
      ),

      GoRoute(
        path: AppPagesName.kverifyIdentityView,
        builder: (context, state) => const VerifyIdentityView(),
      ),
    ],
  );
}
