

  
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavItem extends StatelessWidget {
  const CustomNavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
    required this.isSelected,
  });
  final bool isSelected;

  final IconData icon;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).go(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
