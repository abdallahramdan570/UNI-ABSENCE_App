import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/container_list_items_active_session.dart';

class ActiveSessionCard extends StatelessWidget {
  const ActiveSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 215, 165, 165),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(

        children: [
          SizedBox(height: 15.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              Icon(Icons.info, color: Colors.grey.shade600, size: 20),
              SizedBox(width: 8.w),
              Text(
                'Active Session',
                style: AppStyles.styleTextBold20.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          Divider(
            height: 25.h,
            indent: 10,
            endIndent: 10,
            color: Colors.grey.shade700,
          ),
          ContainerListItemsActiveSession(
            icons: Icon(Icons.location_on_outlined),
            title: 'current Sector',
            subtitle: " Sector 1 (Hall A)",
          ),
          ContainerListItemsActiveSession(
            icons: Icon(Icons.date_range_outlined),
            title: 'Assignment ',
            subtitle: "Hcl Exam",
          ),
        ],
      ),
    );
  }
}
