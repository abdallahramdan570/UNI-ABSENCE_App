
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';

// class SelectDataSection extends StatefulWidget {
//   const SelectDataSection({super.key});

//   @override
//   State<SelectDataSection> createState() => _SelectDataSectionState();
// }

// class _SelectDataSectionState extends State<SelectDataSection> {
//   DateTime _selectedDate = DateTime.now(); // التاريخ الافتراضي بناءً على الصورة

//   @override
//   void initState() {
//     super.initState();
//     // Fetch initial data after widget is built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchExams(_selectedDate);
//     });
//   }

//   void _fetchExams(DateTime date) {
//     // API expects format like 2026/7/10
//     final String formattedDate = '${date.year}/${date.month}/${date.day}';
//     context.read<ExamCubit>().fetchExamsByDate(formattedDate);
//   }

//   // دالة لإظهار الـ Date Picker الخاص بـ Flutter عند الضغط
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//       _fetchExams(picked);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // النص العلوي (Select Date)
//           Text(
//             'Select Date',
//             style:
//              TextStyle(
//               fontSize: 16.sp,
//               color: const Color(0xFF374151), // لون رمادي غامق متناسق
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           SizedBox(height: 4.h),
//           // الحقل الرئيسي المحيط بالتاريخ والزر
//           GestureDetector(
//             onTap: () => _selectDate(context), // يفتح النتيجة عند الضغط على الحقل بالكامل
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.r), // حواف دائرية كبيرة كما في الصورة
//                 border: Border.all(
//                   color: const Color(0xFFE5E7EB), // لون الحدود الخفيفة
//                   width: 1,
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // نص التاريخ المختار
//                   Text(
//                     DateFormat('MM/dd/yyyy').format(_selectedDate), // تنسيق التاريخ مثل الصورة
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                       color: const Color(0xFF1F2937),
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   // زر "Today" المخصص في اليمين
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFEBF3FC), // الخلفية الزرقاء الخفيفة جداً للزر
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(
//                         color: const Color(0xFFD2E4F9),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.calendar_today_outlined,
//                           size: 18.sp,
//                           color: const Color(0xFF004085), // اللون الأزرق الداكن للأيقونة والنص
//                         ),
//                         SizedBox(width: 6.w),
//                         Text(
//                           'Today',
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                             color: const Color(0xFF004085),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';

class SelectDataSection extends StatefulWidget {
  const SelectDataSection({super.key});

  @override
  State<SelectDataSection> createState() => _SelectDataSectionState();
}

class _SelectDataSectionState extends State<SelectDataSection> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchExams(_selectedDate);
    });
  }

  void _fetchExams(DateTime date) {
    final formattedDate = '${date.year}/${date.month}/${date.day}';
    context.read<ExamCubit>().fetchExamsByDate(formattedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
      _fetchExams(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Date",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff374151),
            ),
          ),

          SizedBox(height: 8.h),

          InkWell(
            borderRadius: BorderRadius.circular(20.r),
            onTap: () => _selectDate(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: const Color(0xffE5E7EB),
                ),
              ),
              child: Row(
                children: [
                  /// التاريخ
                  Expanded(
                    child: Text(
                      DateFormat('MM/dd/yyyy').format(_selectedDate),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xff1F2937),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),

                  /// زر Today
                  FittedBox(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffEBF3FC),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xffD2E4F9),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 16.sp,
                            color: const Color(0xff004085),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff004085),
                            ),
                          ),
                        ],
                      ),
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