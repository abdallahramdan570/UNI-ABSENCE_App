import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uni_absence/core/utils/styles.dart';
// removed unused import
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/exam_report_table.dart';
import 'package:uni_absence/features/ExamDetails/presentation/views/widgets/final_statisticscard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_cubit.dart';
import 'package:uni_absence/features/ExamDetails/presentation/cubit/exam_record_state.dart';

class ScrollSection extends StatelessWidget {
  const ScrollSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              "FINAL STATISTICS",
              style: AppStyles.styleTextBold20.copyWith(color: Colors.blue),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 5.h)),

          SliverToBoxAdapter(
            child: BlocBuilder<ExamRecordCubit, ExamRecordState>(
              builder: (context, state) {
                if (state is ExamRecordLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ExamRecordError) {
                  return Center(child: Text(state.message));
                } else if (state is ExamRecordLoaded) {
                  return Column(
                    children: [
                      FinalStatisticsCard(
                        students: state
                            .records, // We will need to update FinalStatisticsCard to accept List<ExamRecordEntity>
                      ),
                      SizedBox(height: 10.h),
                      ExamReportTable(students: state.records),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
