import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/custom_appbar_dashboard.dart';
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
