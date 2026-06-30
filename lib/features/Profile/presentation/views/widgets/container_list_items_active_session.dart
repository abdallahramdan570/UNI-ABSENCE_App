
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/features/Profile/presentation/views/profile_views.dart';
import 'package:uni_absence/features/Profile/presentation/views/widgets/list_tile_items.dart';

class ContainerListItemsActiveSession extends StatelessWidget {
  const ContainerListItemsActiveSession({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
  });

  final Icon icons;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF2F3FC).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            ListTileItems(icon: icons, title: title, subtitle: subtitle),
          ],
        ),
      ),
    );
  }
}
