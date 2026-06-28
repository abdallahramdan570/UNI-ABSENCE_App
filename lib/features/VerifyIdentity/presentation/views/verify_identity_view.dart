import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/color.dart';
import 'package:uni_absence/core/utils/styles.dart';
import 'package:uni_absence/features/VerifyIdentity/presentation/views/widgets/verify_identity_view_body.dart';

class VerifyIdentityView extends StatelessWidget {
  const VerifyIdentityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff004494)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Verify Identity',
          style: TextStyle(color:AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.grey),
            onPressed: () {},
          )
        ],
      ),

      body: VerifyIdentityViewbody(),
    );
  }
}