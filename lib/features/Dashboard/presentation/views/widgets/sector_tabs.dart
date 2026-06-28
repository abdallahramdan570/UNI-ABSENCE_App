import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/attend_manually_buttom.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/divider_items.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/exam_card.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/text_exam.dart';

class SectorTabsSection extends StatefulWidget {
  SectorTabsSection({super.key});

  @override
  State<SectorTabsSection> createState() => _SectorTabsSectionState();
}

class _SectorTabsSectionState extends State<SectorTabsSection> {
  int selectedSector = 0;

  final sector1Exams = [
    ExamModel(
      examName: 'Computer Science - HCI Exam',
      totalStudents: 50,
      currentStudents: 50,
      examTime: '10:00 AM - 12:00 PM',
      status: 'Completed',
    ),
    ExamModel(
      examName: 'Database Systems',
      totalStudents: 60,
      currentStudents: 40,
      examTime: '01:00 PM - 03:00 PM',
      status: 'Pending',
    ),
  ];

  final sector2Exams = [
    ExamModel(
      examName: 'Calculus Midterm',
      totalStudents: 40,
      currentStudents: 15,
      examTime: '09:00 AM - 11:00 AM',
      status: 'Completed',
    ),
    ExamModel(
      examName: 'Physics Final',
      totalStudents: 70,
      currentStudents: 70,
      examTime: '02:00 PM - 04:00 PM',
      status: 'Pending',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List<ExamModel> activeExams = selectedSector == 0
        ? sector1Exams
        : sector2Exams;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSector = 0;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'sector 1',
                        style: AppStyles.styleTextBold20.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),

                      const SizedBox(height: 4),

                      DividerItems(
                        thickness: 2,
                        color: selectedSector == 0
                            ? AppColors.primaryBlue
                            : Colors.grey[500]!,
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSector = 1;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'sector 2',
                        style: AppStyles.styleTextBold20.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),

                      const SizedBox(height: 4),
                      DividerItems(
                        thickness: 2,
                        color: selectedSector == 1
                            ? AppColors.primaryBlue
                            : Colors.grey[500]!,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          TextExam(selectedSector: selectedSector),
          SizedBox(height: 10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activeExams.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: ExamCard(examData: activeExams[index]),
              );
            },
          ),

          AttendManuallyButtom(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
