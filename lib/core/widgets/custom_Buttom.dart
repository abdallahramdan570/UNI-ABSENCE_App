import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlue, // Set the background color

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.styleTextBold20.copyWith(color: Colors.white), // Set the text color
         
        ),
      ),
    );
  }
}
