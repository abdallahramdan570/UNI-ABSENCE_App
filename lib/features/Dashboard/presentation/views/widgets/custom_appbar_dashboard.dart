import 'package:flutter/material.dart';
// removed unused imports
import 'package:uni_absence/core/widgets/custom_appbar.dart';

class CustomAppBarDashboard extends StatelessWidget {
  const CustomAppBarDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBar(),

          IconButton(
            icon: const Icon(Icons.filter_list_outlined),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
    );
  }
}
