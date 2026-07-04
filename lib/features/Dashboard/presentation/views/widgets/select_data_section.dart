
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';

class SelectDataSection extends StatefulWidget {
  const SelectDataSection({super.key});

  @override
  State<SelectDataSection> createState() => _SelectDataSectionState();
}

class _SelectDataSectionState extends State<SelectDataSection> {
  DateTime _selectedDate = DateTime(2026, 06, 24); // التاريخ الافتراضي بناءً على الصورة

  @override
  void initState() {
    super.initState();
    // Fetch initial data after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchExams(_selectedDate);
    });
  }

  void _fetchExams(DateTime date) {
    // API expects format like 2026/7/10
    final String formattedDate = '${date.year}/${date.month}/${date.day}';
    context.read<ExamCubit>().fetchExamsByDate(formattedDate);
  }

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
      _fetchExams(picked);
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