import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/attendance_records_views.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/dashboard_views.dart';
import 'package:uni_absence/features/ExamDetails/presentation/exam-details_veiws.dart';
import 'package:uni_absence/features/History/presentation/views/history_views.dart';
import 'package:uni_absence/features/History/presentation/views/widgets/history_body_views.dart';
import 'package:uni_absence/features/Profile/presentation/views/profile_views.dart';
import 'package:uni_absence/features/SubmissionStatus/presentation/views/submission_status_view.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/verify_identity_view.dart';
import 'package:uni_absence/features/login/presentation/views/login_view.dart';
import 'package:uni_absence/features/splash/presentation/views/splash_views.dart';

abstract class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashViews()),
      GoRoute(
        path: AppPagesName.kloginView,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(path:AppPagesName.kdashboardView ,
        builder: (context, state) => const DashboardViews(),
        ),
    GoRoute(path:AppPagesName.kattendanceView ,
        builder: (context, state) => const AttendanceRecordsViews(),
        ),
        GoRoute(path:AppPagesName.khistoryView ,
        builder: (context, state) => const HistoryViews(),

        ),
GoRoute(path:AppPagesName.kprofileView ,
        builder: (context, state) => const ProfileViews(),
        ),
    GoRoute(path:AppPagesName.kexamDetailsView ,
        builder: (context, state) => const ExamDetailsViews(),
        ),
      GoRoute(
  path: AppPagesName.ksubmissionStatusView,
  builder: (context, state) {

  final course =
    state.extra as CourseAttendanceModel;

    return SubmissionSuccessView(
      course: course,
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
