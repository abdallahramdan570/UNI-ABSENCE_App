import 'package:flutter/material.dart';
import 'package:uni_absence/core/widgets/navigation/custom_bottom_nav_bar.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/custom_appbar_dashboard.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/dashboard_views_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/core/di/dependency_injection.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';

class DashboardViews extends StatelessWidget {
  const DashboardViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ExamCubit>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: CustomAppBarDashboard(),
        ),

        body: const DashboardViewsBody(),

        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 0,
        ),
      ),
    );
  }
}
