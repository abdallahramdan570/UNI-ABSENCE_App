
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/utils/color.dart';
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
