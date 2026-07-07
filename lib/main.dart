import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/di/dependency_injection.dart' as di;
import 'package:uni_absence/core/routing/app_routes.dart';
import 'package:uni_absence/core/utils/function/setup_service_locator.dart';
import 'package:uni_absence/features/Settings/presentation/cubit/app_flobal_state.dart';
import 'package:uni_absence/features/Settings/presentation/cubit/app_global_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // تأكد أن di.init() يقوم بعمل registerLazySingleton لـ AppGlobalCubit
  runApp(
    BlocProvider(
      create: (context) => di.sl<AppGlobalCubit>(),
      child: Uni_AbsenceApp(),
      // DevicePreview(
      //   enabled:
      //       true, // قم بتغيير هذا إلى true إذا كنت تريد تفعيل Device Preview
      //   builder: (context) => const Uni_AbsenceApp(),
      // ),
    ),
  );
}

class Uni_AbsenceApp extends StatelessWidget {
  const Uni_AbsenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // الربط بالـ BlocBuilder هنا لتغيير الثيم عالمياً
        return BlocBuilder<AppGlobalCubit, SettingsState>(
          builder: (context, state) {
            final cubit = context.read<AppGlobalCubit>();
            return MaterialApp.router(
              locale: DevicePreview.locale(
                context,
              ), // استخدم locale من DevicePreview
              builder: DevicePreview
                  .appBuilder, // استخدم appBuilder من DevicePreview
              debugShowCheckedModeBanner: false,
              routerConfig: AppRoutes.routes,
              // هنا التحكم العالمي في التطبيق كله
              themeMode: cubit.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
            );
          },
        );
      },
    );
  }
}
