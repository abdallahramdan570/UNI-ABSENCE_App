// 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/attendance_stats_section_and_bottum.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/custom_search_text_field.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/data_list.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/name_subjects.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/student_attendance_card.dart';
import 'package:uni_absence/features/AttendanceRecords/presentation/views/widgets/student_total.dart';

class AttendanceRecordsViewBody extends StatefulWidget {
  const AttendanceRecordsViewBody({super.key, required this.examData});
  final ExamModel examData;

  @override
  State<AttendanceRecordsViewBody> createState() => _AttendanceRecordsViewBodyState();
}

class _AttendanceRecordsViewBodyState extends State<AttendanceRecordsViewBody> {
  // متغير لتخزين النص اللي المستخدم بيكتبه في خانة البحث
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // ─── منطق البحث والتصفية الذكي (بالاسم، الـ ID، والقسم) ───
    final filteredStudents = studentsList.where((student) {
      final query = searchQuery.toLowerCase().trim();
      
      // لو خانة البحث فارغة، اعرض كل الطلاب بدون تصفية
      if (query.isEmpty) return true;

      // فحص المطابقة مع تحويل النصوص لـ Lowercase لضمان دقة البحث
      final matchesName = student.name.toLowerCase().contains(query);
      final matchesId = student.id.toLowerCase().contains(query);
      final matchesDept = student.department.toLowerCase().contains(query);

      // يعيد true لو تطابق النص مع أي خانة من الثلاثة
      return matchesName || matchesId || matchesDept;
    }).toList();

    return Column(
      children: [
        // 1️⃣ الجزء العلوي القابل للتمرير (العناوين + خانة البحث المربوطة بالـ State + الكروت)
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameSubjects(
                  subjectName: widget.examData.examName,
                  sectorNumber: widget.examData.sectorId,
                ),
                const SizedBox(height: 16),
                StudentTotal(
                  sectorNumber: widget.examData.sectorId,
                  totalStudents: widget.examData.totalStudents,
                  subjectName: widget.examData.examName,
                ),
                const SizedBox(height: 16),
                
                // 📝 تعديل شريط البحث: نمرر له دالة onChanged لتحديث الـ State فوراً
                CustomSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // تحديث نص البحث وإعادة بناء القائمة
                    });
                  },
                ),
                const SizedBox(height: 16),

                // عرض الطلاب بناءً على القائمة المصفاة (filteredStudents)
                filteredStudents.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: Text(
                            "No students found!",
                            style: AppStyles.styleTextBold20.copyWith(color: Colors.grey),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), // السكرول الخارجي يتولى الحركة
                        itemCount: filteredStudents.length,
                        itemBuilder: (context, index) {
                          return StudentAttendanceCard(student: filteredStudents[index]);
                        },
                      ),
              ],
            ),
          ),
        ),
        // 2️⃣ الجزء السفلي الثابت (الإحصائيات + زر المراجعة والتقديم)
         AttendanceStatsSectionAndBottum(),
      ],
    );
  }
}