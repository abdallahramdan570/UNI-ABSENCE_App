
import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4FA),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "Code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff004494),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff004494),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Dept",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff004494),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Status",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff004494),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
