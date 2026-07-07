import 'package:flutter/material.dart';
// removed unused import
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/core/widgets/navigation/bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 10),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomNavItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              route: AppPagesName.kdashboardView,
              isSelected: currentIndex == 0,
            ),
            CustomNavItem(
              icon: Icons.settings,
              title: 'Settings',
              route: AppPagesName.ksettingsView,
              isSelected: currentIndex == 1,
            ),
            // CustomNavItem(
            //   icon: Icons.date_range,
            //   title: 'Exam Details',
            //   route: AppPagesName.kexamDetailsView,
            //   isSelected: currentIndex == 2,
            // ),
            CustomNavItem(
              icon: Icons.person_outline,
              title: 'Profile',
              route: AppPagesName.kprofileView,
              isSelected: currentIndex == 2,
            ),
          ],
        ),
      ),
    );
  }
}
