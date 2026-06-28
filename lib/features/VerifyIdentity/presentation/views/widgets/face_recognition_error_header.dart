
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceRecognitionErrorHeader extends StatelessWidget {
  const FaceRecognitionErrorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: const BoxDecoration(
            color: Color(0xffFCE8E6),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.face_retouching_off_outlined,
            color: Colors.red,
            size: 30,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Face Recognition Failed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "Please enter student's 6-digit PIN to authorize attendance.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF191C21),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
      ],
    );
  }
}
