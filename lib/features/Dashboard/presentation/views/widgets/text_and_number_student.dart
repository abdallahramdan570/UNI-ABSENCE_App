
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';

class TextAndNumberStudent extends StatelessWidget {
  const TextAndNumberStudent({
    super.key,
    required this.textTotalStudent,
    required this.textCurrentStudent,
  });
  final int textTotalStudent;
  final int textCurrentStudent;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xFFD9E6DA)),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              'MULTIPLE LEVELS/DEPTS',
              style: AppStyles.mediumRegular15.copyWith(color: Colors.black),
            ),
          ),
        ),
        SizedBox(width: 8.w),

        Row(
          children: [
            Icon(Icons.person, color: Colors.green, size: 30.sp),

            SizedBox(width: 4.w),
            RichText(
              text: TextSpan(
                text: textCurrentStudent.toString(),
                style: TextStyle(color: Color(0xFF35373C), fontSize: 16.0),
                children: [
                  TextSpan(
                    text: ' / ', // الشرطة المائلة كصيغة نصية مريحة في المحاذاة
                    style: TextStyle(
                      color: Color(0xFF35373C),
                      //color: Colors.grey[900],
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: textTotalStudent.toString(),
                    style: TextStyle(
                      color: Color(0xff004080),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
