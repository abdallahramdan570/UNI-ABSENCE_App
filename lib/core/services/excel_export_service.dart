import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uni_absence/features/ExamDetails/domain/entities/exam_record_entity.dart';
import 'package:universal_html/html.dart' as html;

class ExcelExportService {
  ExcelExportService._();

  static Future<void> exportAttendanceToExcel({
    required String examName,
    required List<ExamRecordEntity> students,
  }) async {
    final excel = Excel.createExcel();

    // Create or get the sheet named after the exam
    final sheet = excel[examName];

    final headers = [
      'Student Name',
      'Department',
      'Status',
      'Entry Time',
      'Exit Time',
    ];

    // Append header row using TextCellValue
    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    // Style header row (bold). Color APIs vary between excel package versions.
    final headerStyle = CellStyle(bold: true);

    for (var col = 0; col < headers.length; col++) {
      final cell = sheet.cell(
        CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0),
      );
      cell.cellStyle = headerStyle;
    }

    // Append student rows
    for (final s in students) {
      final status = (s.entryTime != null && s.entryTime!.isNotEmpty)
          ? 'Present'
          : 'Absent';
      sheet.appendRow([
        TextCellValue(s.name),
        TextCellValue(s.department),
        TextCellValue(status),
        TextCellValue(s.entryTime ?? ''),
        TextCellValue(s.exitTime ?? ''),
      ]);
    }

    final bytes = excel.encode();
    if (bytes == null) return;

    if (kIsWeb) {
      // Download as a Blob on Web
      final data = Uint8List.fromList(bytes);
      final blob = html.Blob([
        data,
      ], 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement;
      anchor.href = url;
      anchor.download = '${examName.replaceAll(' ', '_')}_attendance.xlsx';
      anchor.style.display = 'none';
      html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();
      html.Url.revokeObjectUrl(url);
    } else {
      // Non-web platforms: leave bytes available for writing to file by caller.
      // Could write to device storage using path_provider if desired.
    }
  }
}
