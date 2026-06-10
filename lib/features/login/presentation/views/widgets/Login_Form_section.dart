import 'package:flutter/material.dart';
import 'package:uni_absence/core/utils/styles.dart';

class LoginFormSection extends StatefulWidget {
   LoginFormSection({
    super.key,
    required this.icon,
    required this.validator,
    required this.hintText,
    required this.label,
    this.isPassword = false, 
    this.nextFocusNode,
    


  });
final emailFocusNode = FocusNode();
final passwordFocusNode = FocusNode();
  final String hintText;
  final String label;
  final IconData icon;
 final String? Function(String?)? validator;
  final bool isPassword;
 final FocusNode? nextFocusNode;
  

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
    bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppStyles.mediumRegular15,
          ),

          const SizedBox(height: 8),

          TextFormField(
            focusNode: widget.nextFocusNode,
             
  textInputAction: widget.nextFocusNode != null
      ? TextInputAction.next
      : TextInputAction.done,
  onFieldSubmitted: (_) {
    if (widget.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(
        widget.nextFocusNode,
      );
    }
  },
            
            validator :widget.validator ,
            obscureText:widget.isPassword ?obscureText : false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: Icon(widget.icon),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility ,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}