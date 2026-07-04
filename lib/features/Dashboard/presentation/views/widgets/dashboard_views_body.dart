import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// removed unused imports
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/sector_tabs.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/select_data_section.dart';

class DashboardViewsBody extends StatelessWidget {
  const DashboardViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectDataSection(),
          SizedBox(height: 15.h),

          SectorTabsSection(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
