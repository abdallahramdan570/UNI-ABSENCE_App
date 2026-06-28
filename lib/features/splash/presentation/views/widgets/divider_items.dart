
import 'package:flutter/material.dart';

class Divideritems extends StatelessWidget {
  const Divideritems({
    super.key, required int thickness, required Color color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade600,
            thickness: 1.5,
            indent: 20,
            endIndent: 15,
          ),
        ),
    
        Icon(Icons.school_outlined),
    
        Expanded(
          child: Divider(
            color: Colors.grey.shade600,
            thickness: 1.5,
            indent: 20,
            endIndent: 15,
          ),
        ),
      ],
    );
  }
}