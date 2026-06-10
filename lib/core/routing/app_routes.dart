import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/dashboard_views.dart';
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
    ],
  );
}
