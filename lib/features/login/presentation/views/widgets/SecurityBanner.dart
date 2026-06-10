import 'dart:ui';

import 'package:flutter/material.dart';

class SecurityBanner extends StatelessWidget {
  const SecurityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return 

Container(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
  decoration: BoxDecoration(
    // لون خلفية أحمر خفيف جداً شفاف
    color: const Color(0xFFFFF5F5), 
    // حدود حمراء خفيفة دائرية
    borderRadius: BorderRadius.circular(30.0),
    border: Border.all(
      color: const Color(0xFFFFE5E5),
      width: 2.0,
    ),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min, // عشان ياخد مساحة الـ widget بس ميتفردش بالعرض كله
    children: const [
      // أيقونة الحماية/التحذير باللون الأحمر الداكن
      Icon(
        Icons.admin_panel_settings_outlined, // أو Icons.gpp_maybe_outlined أو Icons.error_override
        color: Color(0xFF990000),
        size: 25.0,
      ),
      SizedBox(width: 8.0), // مسافة بين الأيقونة والنص
      // النص باللون الأحمر الداكن وبخط سميك (Medium/Bold)
      Text(
        'System Administrator Access Only',
        style: TextStyle(
          color: Color(0xFF990000),
          fontSize: 15.0,
          fontWeight: FontWeight.w600, // أو FontWeight.bold
        ),
      ),
    ],
  ),
);
  }
} 