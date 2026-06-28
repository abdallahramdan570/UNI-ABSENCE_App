
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerItems extends StatelessWidget {
  const DividerItems({super.key, required this.thickness, required this.color});
final double thickness;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ,
      height: 10.h,
      indent: 15.w,
      endIndent: 15.w,
      color: color,
    );
  }
}
