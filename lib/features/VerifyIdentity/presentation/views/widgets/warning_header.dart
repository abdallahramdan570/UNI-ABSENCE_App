
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WarningHeader extends StatelessWidget {
  const WarningHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.all(8.0),
      child: const Row(
        children: [
         FaIcon(
            FontAwesomeIcons.circleExclamation,
            color: Colors.red,
            size: 20,
          ),
          SizedBox(width: 12),
          Flexible(
            child: Text(
              'تنبيه: سيتم فتح باب الخزانة تلقائياً فور تسجيل حضور الطالب.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}