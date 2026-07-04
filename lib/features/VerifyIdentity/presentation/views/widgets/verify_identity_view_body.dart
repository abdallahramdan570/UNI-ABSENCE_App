import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// removed unused imports
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/widgets/face_recognition_error_header.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/widgets/student_profile_card.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/widgets/warning_header.dart';

class VerifyIdentityViewbody extends StatelessWidget {
  const VerifyIdentityViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StudentProfileCard(),
            SizedBox(height: 16.h),
            const WarningHeader(),
            SizedBox(height: 5.h),
            const FaceRecognitionErrorHeader(),

            SizedBox(height: 20.h),
            PinBoxesRow(pinLength: 0),
            SizedBox(height: 20.h),
            CustomNumKeypad(
              onKeyPressed: (value) {
                // هنا يمكنك التعامل مع الضغط على الأزرار
                print('Pressed: $value');
              },
            ),
            SizedBox(height: 10.h),
            CustomVerifyIdentityButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────────────────
// 🧱 3. صف مربعات الـ PIN الستة (PIN Boxes Row)
// ────────────────────────────────────────────────────────
class PinBoxesRow extends StatelessWidget {
  final int pinLength;
  const PinBoxesRow({super.key, required this.pinLength});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        // فحص هل المربع الحالي يحتوي على رقم تم إدخاله أم فارغ
        bool isFilled = index < pinLength;

        return Container(
          width: 48.w,
          height: 54.h,
          decoration: BoxDecoration(
            color: isFilled
                ? const Color(0xff004494).withValues(alpha: 0.05)
                : const Color(0xffF1F5F9),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isFilled ? const Color(0xff004494) : Colors.grey.shade300,
              width: isFilled ? 1.8 : 1.0,
            ),
          ),
          alignment: Alignment.center,
          child: isFilled
              ? Container(
                  width: 12.h,
                  height: 12.h,
                  decoration: const BoxDecoration(
                    color: Color(0xff004494),
                    shape: BoxShape.circle,
                  ),
                )
              : null,
        );
      }),
    );
  }
}

// ────────────────────────────────────────────────────────
// ⌨️ 4. لوحة المفاتيح الرقمية المخصصة (Custom Num Keypad)
// ────────────────────────────────────────────────────────
class CustomNumKeypad extends StatelessWidget {
  final Function(String) onKeyPressed;
  const CustomNumKeypad({super.key, required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    // توزيع الأزرار كـ Grid مع الحفاظ على الأزرار الخاصة (Clear و Backspace)
    final List<String> keys = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "Clear",
      "0",
      "backspace",
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: keys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.8, // نسبة تناسب العرض مع الارتفاع للأزرار كالتصميم
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
      ),
      itemBuilder: (context, index) {
        final key = keys[index];
        bool isSpecialKey = key == "Clear" || key == "backspace";

        return InkWell(
          onTap: () => onKeyPressed(key),
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            decoration: BoxDecoration(
              color: isSpecialKey ? const Color(0xffE2E5ED) : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: isSpecialKey
                  ? null
                  : Border.all(color: Colors.grey.shade300),
            ),
            alignment: Alignment.center,
            child: key == "backspace"
                ? const Icon(Icons.backspace_outlined, color: Colors.grey)
                : Text(
                    key,
                    style: TextStyle(
                      fontSize: isSpecialKey ? 15.sp : 18.sp,
                      fontWeight: isSpecialKey
                          ? FontWeight.w600
                          : FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class CustomVerifyIdentityButton extends StatefulWidget {
  const CustomVerifyIdentityButton({super.key});

  @override
  State<CustomVerifyIdentityButton> createState() =>
      _CustomVerifyIdentityButtonState();
}

class _CustomVerifyIdentityButtonState
    extends State<CustomVerifyIdentityButton> {
  String pinCode = "";

  // دالة للتحكم في الضغط على لوحة المفاتيح
  void onKeypadPressed(String value) {
    if (value == "Clear") {
      setState(() {
        pinCode = "";
      });
    } else if (value == "backspace") {
      if (pinCode.isNotEmpty) {
        setState(() {
          pinCode = pinCode.substring(0, pinCode.length - 1);
        });
      }
    } else {
      if (pinCode.length < 6) {
        setState(() {
          pinCode += value;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return // 5️⃣ الزر السفلي الثابت للتأكيد والتسجيل
    Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 30.h,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff004494),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 0,
          ),
          onPressed: pinCode.length == 6
              ? () {
                  // أكشن التحقق والتسجيل النهائي
                }
              : null, // تعطيل الزر لو الـ PIN مش كامل
          icon: const Icon(
            Icons.person_add_alt_1_outlined,
            color: Colors.white,
          ),
          label: const Text(
            'Verify & Register Attendance',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

// class WarningHeader extends StatelessWidget {
//   const WarningHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: const Row(
//         children: [
//          FaIcon(
//             FontAwesomeIcons.circleExclamation,
//             color: Colors.red,
//             size: 20,
//           ),
//           SizedBox(width: 12),
//           Flexible(
//             child: Text(
//               'تنبيه: سيتم فتح باب الخزانة تلقائياً فور تسجيل حضور الطالب.',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 15,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FaceRecognitionErrorHeader extends StatelessWidget {
//   const FaceRecognitionErrorHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(12.w),
//           decoration: const BoxDecoration(
//             color: Color(0xffFCE8E6),
//             shape: BoxShape.circle,
//           ),
//           child: const Icon(
//             Icons.face_retouching_off_outlined,
//             color: Colors.red,
//             size: 30,
//           ),
//         ),
//         SizedBox(height: 12.h),
//         Text(
//           'Face Recognition Failed',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 18.sp,
//           ),
//         ),
//         SizedBox(height: 6.h),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           child: Text(
//             "Please enter student's 6-digit PIN to authorize attendance.",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14.sp,
//               height: 1.3,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
