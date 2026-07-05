import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Use the domain entity for compatibility with the cubit
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:uni_absence/core/services/excel_export_service.dart';

class DownloadExportReportFile extends StatelessWidget {
  // استقبال البيانات ديناميكياً من الشاشة الأساسية
  final String examName;
  final List<ExamRecordEntity> studentsList;
 

  const DownloadExportReportFile({
    super.key,
    required this.examName,
    required this.studentsList,
    
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {
          // 🔥 هنا قمنا بربط السيرفيس الجديدة وضخ البيانات فوراً عند الضغط
          ExcelExportService.exportAttendanceToExcel(
            examName: examName,
            students: studentsList,
          );
        },
        icon: const Icon(Icons.download, size: 20, color: Color(0xFF757575)),
        label: Text(
          'Export Report (Excel/PDF)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF757575),
          ),
        ),
        style: OutlinedButton.styleFrom(
          minimumSize: Size(290.w, 42.h),
          side: const BorderSide(color: Color(0xFF757575)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
