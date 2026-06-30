import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';

class ListTileItems extends StatelessWidget {
  const ListTileItems({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final Icon icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minTileHeight: 0.h,
        leading: Icon(icon.icon, color: Colors.grey.shade700, size: 24.sp),
        title: Text(
          title,
          style: AppStyles.styleTextBold20.copyWith(
            color: Colors.grey.shade700,
            fontSize: 17.sp,
          ),
        ),
        subtitle: Text(subtitle, style: AppStyles.mediumRegular15),
      ),
    );
  }
}
