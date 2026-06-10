import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uni_absence/core/utils/app_assets.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/custom_appbar_dashboard.dart';

class DashboardViewsBody extends StatelessWidget {
  const DashboardViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBarDashboard(),
      ),
      body: Column(children: [
        const CustomDatePicker(),
        SizedBox(height: 20.h),

          
      ],)
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime(2026, 06, 24); // التاريخ الافتراضي بناءً على الصورة

  // دالة لإظهار الـ Date Picker الخاص بـ Flutter عند الضغط
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // النص العلوي (Select Date)
          Text(
            'Select Date',
            style:
             TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF374151), // لون رمادي غامق متناسق
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          // الحقل الرئيسي المحيط بالتاريخ والزر
          GestureDetector(
            onTap: () => _selectDate(context), // يفتح النتيجة عند الضغط على الحقل بالكامل
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r), // حواف دائرية كبيرة كما في الصورة
                border: Border.all(
                  color: const Color(0xFFE5E7EB), // لون الحدود الخفيفة
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // نص التاريخ المختار
                  Text(
                    DateFormat('MM/dd/yyyy').format(_selectedDate), // تنسيق التاريخ مثل الصورة
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // زر "Today" المخصص في اليمين
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF3FC), // الخلفية الزرقاء الخفيفة جداً للزر
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFD2E4F9),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18.sp,
                          color: const Color(0xFF004085), // اللون الأزرق الداكن للأيقونة والنص
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Today',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF004085),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class SlectorItem extends StatelessWidget {
  const SlectorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        children:[
Text('Slector1'),
SizedBox(width: 20.w),
Divider(),
        ]
      ),
      SizedBox(width: 20.w),
      Column(
        children:[
Text('Slector2'),
SizedBox(width: 20.w),
Divider(),

        ]
      ),
    ],);
  }
}