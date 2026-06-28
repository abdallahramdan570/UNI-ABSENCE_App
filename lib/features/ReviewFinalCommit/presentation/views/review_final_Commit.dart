// import 'package:flutter/material.dart';

// class ReviewFinalCommit extends StatelessWidget {
//   const ReviewFinalCommit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//   child: Column(
//     children: [
//       ReviewCard(),
//       SizedBox(height: 16),

//       FlaggedStudentsCard(),
//       SizedBox(height: 12),

//       Text(
//         '2 students flagged for final verification in HCI.',
//       ),

//       SizedBox(height: 24),

//       ConfirmButton(),

//       SizedBox(height: 12),

//       EditButton(),
//     ],
//   ),
// )
//   }
// }

// class ReviewCard extends StatelessWidget {
//   const ReviewCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   padding: const EdgeInsets.all(16),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(16),
//     border: Border.all(
//       color: Colors.grey.shade300,
//     ),
//   ),
//   child: Column(
//     children: [
//       Text(
//         'HCI REVIEW',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 20,
//         ),
//       ),

//       Text(
//         '(Section A - 25 Students)',
//       ),

//       Divider(),

//       Row(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceAround,
//         children: [
//           StatisticItem(
//             title: 'CHECKED',
//             value: '25/25',
//             color: Colors.blue,
//           ),

//           StatisticItem(
//             title: 'PRESENT',
//             value: '23',
//             color: Colors.green,
//           ),

//           StatisticItem(
//             title: 'ABSENT',
//             value: '2',
//             color: Colors.red,
//           ),
//         ],
//       ),
//     ],
//   ),
// )
//   }
// }
// class FlaggedStudentsCard extends StatelessWidget {
//   const FlaggedStudentsCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//   padding: const EdgeInsets.all(12),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(14),
//     border: Border.all(
//       color: Colors.grey.shade300,
//     ),
//   ),
//   child: Row(
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment:
//               CrossAxisAlignment.start,
//           children: const [
//             Text('Aisha Khan'),
//             SizedBox(height: 4),
//             Text('Marcus Wong'),
//           ],
//         ),
//       ),

//       Container(
//         width: 32,
//         height: 32,
//         decoration: const BoxDecoration(
//           color: Colors.green,
//           shape: BoxShape.circle,
//         ),
//         child: const Icon(
//           Icons.check,
//           color: Colors.white,
//           size: 18,
//         ),
//       ),
//     ],
//   ),
// )
//   }
// }

// class ConfirmButton extends StatelessWidget {
//   const ConfirmButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//   width: double.infinity,
//   height: 50,
//   child: ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.green,
//       shape: RoundedRectangleBorder(
//         borderRadius:
//             BorderRadius.circular(12),
//       ),
//     ),
//     child: const Text(
//       'Confirm & Final Submission',
//     ),
//   ),
// )
//   }
// }


// class EditButton extends StatelessWidget {
//   const EditButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//   width: double.infinity,
//   height: 50,
//   child: ElevatedButton(
//     onPressed: () {},
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.grey,
//       shape: RoundedRectangleBorder(
//         borderRadius:
//             BorderRadius.circular(12),
//       ),
//     ),
//     child: const Text(
//       'Edit Sheet',
//     ),
//   ),
// )
//   }
// }

// class StatisticItem extends StatelessWidget {
//   const StatisticItem({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.color,
//   });

//   final String title;
//   final String value;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 11,
//             color: Colors.grey,
//           ),
//         ),

//         SizedBox(height: 4),

//         Text(
//           value,
//           style: TextStyle(
//             color: color,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ],
//     );
//   }
// }
