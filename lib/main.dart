import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni_absence/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/features/splash/presentation/views/splash_views.dart';

void main() {
  runApp(const Uni_AbsenceApp());
}

// ignore: camel_case_types
class Uni_AbsenceApp extends StatelessWidget {
  const Uni_AbsenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.routes,

          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFF5F5F5),
            textTheme: GoogleFonts.montserratTextTheme(),
            ),
          
        );
      },

    );
  }
}