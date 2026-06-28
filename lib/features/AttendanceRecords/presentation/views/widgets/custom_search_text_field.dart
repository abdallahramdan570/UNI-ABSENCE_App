import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});
final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        hintText: 'Search by ID or student Name or Department ',
        hintStyle: const TextStyle(
          color: AppColors.textSubtitle,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: const IconButton(
          onPressed: null,
          icon: Icon(Icons.search, size: 30, color: AppColors.textSubtitle),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.textSubtitle, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.primaryBlue, width: 4),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.textSubtitle, width: 2),
        ),
      ),
    );
  }
}
