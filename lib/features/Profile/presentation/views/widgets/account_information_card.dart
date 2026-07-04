import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
// removed unused import
import 'package:uni_absence/features/Profile/presentation/views/widgets/list_tile_items.dart';

class AccountInformationCard extends StatelessWidget {
  const AccountInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                'Account Information',
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
          ListTileItems(
            icon: Icon(Icons.email_outlined),
            title: 'Email',
            subtitle: "dr.ahmed.mansour@example.com",
          ),

          ListTileItems(
            icon: Icon(Icons.language_outlined),
            title: 'Role',
            subtitle: "Senior Lecturer",
          ),

          ListTileItems(
            icon: Icon(Icons.business_outlined),
            title: 'Department',
            subtitle: "Computer Science Department",
          ),
        ],
      ),
    );
  }
}
