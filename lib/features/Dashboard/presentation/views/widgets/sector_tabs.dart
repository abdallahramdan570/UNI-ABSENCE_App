import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/Dashboard/data/models/exam_model.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/attend_manually_buttom.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/divider_items.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/exam_card.dart';
import 'package:uni_absence/features/Dashboard/presentation/views/widgets/text_exam.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_cubit.dart';
import 'package:uni_absence/features/Dashboard/presentation/cubit/exam_state.dart';

class SectorTabsSection extends StatefulWidget {
  SectorTabsSection({super.key});

  @override
  State<SectorTabsSection> createState() => _SectorTabsSectionState();
}

class _SectorTabsSectionState extends State<SectorTabsSection> {
  int selectedSector = 0;

  @override
  Widget build(BuildContext context) {
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
          BlocBuilder<ExamCubit, ExamState>(
            builder: (context, state) {
              if (state is ExamLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExamError) {
                return Center(child: Text(state.message));
              } else if (state is ExamLoaded) {
                // Filter by sectorId (assuming selectedSector 0 = sectorId 1, selectedSector 1 = sectorId 2)
                final activeExams = state.exams
                    .where((exam) => exam.sectorId == selectedSector + 1)
                    .toList();

                if (activeExams.isEmpty) {
                  return const Center(child: Text('No exams found for this sector.'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: activeExams.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: ExamCard(examData: activeExams[index] as ExamModel), // Using ExamModel for compatibility with ExamCard
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),

          AttendManuallyButtom(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
