import 'package:flutter/material.dart';
import 'package:uni_absence/core/widgets/navigation/custom_bottom_nav_bar.dart';

class ProfileViews extends StatelessWidget {
  const ProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      backgroundColor: Colors.green,
      body: const Center(
        child: Text('Profile Content Goes Here  will be implemented later'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
  currentIndex: 3,
),
    );
  }
}